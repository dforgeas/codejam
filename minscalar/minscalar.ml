(* https://code.google.com/codejam/contest/32016/dashboard#s=p0&a=0 *)
let id x = x
let scan_int = Scanf.scanf " %d"
let scan_int64 = Scanf.scanf " %Ld"
let scan_array n =
	let result = Array.make n Int64.zero in
	for i = 0 to n-1 do
		result.(i) <- scan_int64 id
	done;
	result

let () =
	let t = scan_int id in
	for u = 1 to t do
		let n = scan_int id in
		let v1 = scan_array n in
		let v2 = scan_array n in
		Array.fast_sort compare v1;
		Array.fast_sort (fun x y -> -compare x y) v2;
		let prod = Array.fold_left Int64.add Int64.zero (Array.mapi (fun i x -> Int64.mul x v2.(i)) v1) in
		Printf.printf "Case #%d: %Ld\n" u prod
	done
