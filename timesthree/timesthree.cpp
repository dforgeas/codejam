#include <vector>
#include <deque>
#include <cassert>
#include <iostream>

struct popcounter
{
	popcounter(): curr() {}

	void push(int i)
	{
		// 1 times three is 3 == 0b11
		set(i);
		set(i + 1);
	}

	int pop(int i)
	{
		int result = 0;
		while (curr < i && !q.empty()) {
			++curr;
			result += q.front();
			q.pop_front();
		}

		curr = i; // optimize the big jump

		return result;
	}

private:
	void set(int i)
	{
		std::clog << i << ' ';
		while (i - curr + 1 > int(q.size())) q.push_back(0);
		q_t::iterator it = q.begin() + (i - curr);
		if (*it != 0) {
			*it = 0;
			set(i + 1);
		} else {
			*it = 1;
		}
	}
	typedef std::deque<bool> q_t;
	q_t q;
	int curr;
};

int timesthreepopcount(const std::vector<int> &A)
{
	const int N = A.size();
	popcounter pctr;
	int count = 0;
	for (int i = 0; i < N; ++i) {
		const int bit = A[i];
		pctr.push(bit);
		count += pctr.pop(bit);
	}
	count += pctr.pop(0x7fffffff);
	return count;
}

int main()
{
	std::cout << timesthreepopcount({1, 2, 3, 5, 7, 9, 10, 11, 12, 15, 18, 19, 20, 21, 23, 25, 26, 27, 29, 34, 0x70000000, 0x70000001, 0x70000002, 0x70000004, 0x70000005, 0x70000007, 0x70000009, 0x7000000b, 0x70000010}) << '\n';
}
