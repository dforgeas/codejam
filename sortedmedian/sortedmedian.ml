let scan_int () = Scanf.scanf " %d" (fun x -> x)
let scan_float () = Scanf.scanf " %f" (fun x -> x)
let scan_array () =
	let len = scan_int () in
	let result = Array.make len 0. in
	for i = 0 to n - 1 do
		result.(i) <- scan_float ()
	done;
	result

let naive_median a =
	let len = Array.length a in
	if len = 0 then nan else
	let mid = len / 2 in
	if 1 land len = 0 then (* length is even *)
		(a.(mid) +. a.(mid - 1)) /. 2.
	else (* length is odd *)
		a.(mid)

let naive_mean a b =
	let c = Array.append a b in
	Array.fast_sort compare c;
	naive_median c

let () =
	let t = scan_int () in
	for u = 1 to t do
		let a = scan_array () in
		let b = scan_array () in
		Array.fast_sort compare a;
		Array.fast_sort compare b;
		
	done
