let scan_int () = Scanf.scanf " %d" (fun x -> x)
let scan_array n =
	let result = Array.make n 0 in
	for i = 0 to n - 1 do
		result.(i) <- scan_int ()
	done;
	result

let () =
	let t = scan_int () in
	for u = 1 to t do
		let n = scan_int () in
		let a = scan_array n in
		let b = scan_array n in
		Array.fast_sort compare a;
		Array.fast_sort compare b;
		
	done
