/* from https://code.google.com/codejam/contest/189252/dashboard#s=p2 */
#include <iostream>
#include <vector>
#include <map>
#include <utility>

typedef signed int unum_t;

/*void permutations(unum_t N, std::vector<unum_t> &array, void (*output_fn)(std::vector<unum_t>&) )
{
	if (N == 1)
		output_fn(array);
	else
	{
		for (int c = 0; c < N; ++c)
		{
			permutations(N - 1, array, output_fn);
			int i = (N % 2 ? 0 : c);
			unum_t temp = array.at(i);
			array[i] = array.at(N-1);
			array[N-1] = temp;
		}
	}
}

unum_t P;
unum_t min_coins;
std::vector<unum_t> min_prisoners;

void test(std::vector<unum_t> &prisoners)
{
	std::vector<bool> cells(P, true);
	unum_t coins = 0;
	for (std::vector<unum_t>::const_iterator it = prisoners.begin()
		; it != prisoners.end(); ++it)
	{
		cells.at(*it) = false;
		for (unum_t i = *it; i-- > 0; )
		{
			if (cells.at(i)) ++coins;
			else break;
		}
		for (unum_t i = *it + 1; i < P; ++i)
		{
			if (cells.at(i)) ++coins;
			else break;
		}
	}
	if (coins <= min_coins)
	{
		min_coins = coins;
		min_prisoners = prisoners;
	}
}*/

std::vector<unum_t> *pPrisoners;
typedef std::map<std::pair<unum_t, unum_t>, unum_t> memory_t;
memory_t memory;
unum_t solve(unum_t a, unum_t b)
{
	memory_t::const_iterator it = memory.find(std::make_pair(a, b));
	if (it != memory.end())
		return it->second;
	else
	{
		const unum_t Q = pPrisoners->size();
		unum_t min_coins = 0;
		for (unum_t i = 0; i < Q; ++i)
		{
			const unum_t pi = pPrisoners->at(i);
			if (pi >= a && pi <= b)
			{
				const unum_t coins = b - a + solve(a, pi-1) + solve(pi+1, b);
				if (!min_coins || coins < min_coins) min_coins = coins;
			}
		}
		memory.insert(std::make_pair(std::make_pair(a, b), min_coins));
		return min_coins;
	}
}

int run(unum_t n)
{
	unum_t P, Q;
	std::cin >> P >> Q;
	if (std::cin.fail()) return 1;
	else std::clog << "P = " << P << "; Q = " << Q << '\n';

	if (P == 0 || Q == 0) return 3;

	std::vector<unum_t> prisoners(Q);
	std::clog << "prisoners = {";
	for (unum_t i = 0; i < Q; ++i)
	{
		std::cin >> prisoners[i];
		if (std::cin.fail()) return 2;
		else std::clog << --prisoners.at(i) << (i < Q-1 ? ", " : "}\n");
	}

	/*min_coins = static_cast<unum_t>(-1);
	std::vector<bool> cells(P);
	permutations(prisoners.size(), prisoners, test);*/

	pPrisoners = &prisoners;
	memory.clear();
	const unum_t min_coins = solve(0, P - 1);

	std::cout << "Case #" << n << ": " << min_coins << std::endl;
	/*std::clog << "min_prisoners = {";
	for (unum_t i = 0; i < Q; ++i)
		std::clog << min_prisoners.at(i) << (i < Q-1 ? ", " : "}\n");*/
	
	return 0;
}

int main()
{
	unum_t N;
	std::cin >> N;
	if (std::cin.fail()) return 1;
	else std::clog << "N = " << N << '\n';

	for (unum_t n = 1; n <= N; ++n)
	{
		int result = run(n);
		if (result) return result+1;
	}

	return 0;
}
