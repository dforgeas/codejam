(* http://code.google.com/codejam/contest/635101/dashboard#s=p0 *)

let scan_int () = Scanf.scanf " %d" (fun x -> x)
let scan_tuple () = Scanf.scanf " %d %d" (fun x y -> (x, y))

let () =
	let t = scan_int () in
	for u = 1 to t do
		let n, m = scan_tuple () in
