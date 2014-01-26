(* http://code.google.com/codejam/contest/619102/dashboard#s=p0 *)
let id x = x
let scan_int = Scanf.scanf " %d"
let scan_tuple () = Scanf.scanf " %d %d" (fun left right -> (left, right))

let scan_array n =
	let result = Array.make n (0, 0) in
	for i = 0 to n-1 do
		result.(i) <- scan_tuple ()
	done;
	result

let solve v =
	let n = Array.length v in
	let count = ref 0 in
	for i = 0 to n - 1 do
		let vi = v.(i) in
		for j = i + 1 to n - 1 do
			let vj = v.(j) in
			if fst vi < fst vj && snd vi > snd vj
			|| fst vi > fst vj && snd vi < snd vj then
				count := !count + 1
		done
	done;
	!count

let () =
	let t = scan_int id in
	for u = 1 to t do
		let n = scan_int id in
		let v = scan_array n in
		let count = solve v in
		Printf.printf "Case #%d: %d\n" u count
	done
