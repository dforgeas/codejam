(* http://code.google.com/codejam/contest/635101/dashboard#s=p0 *)

let scan_int () = Scanf.scanf "%d\n" (fun x -> x)
let scan_tuple () = Scanf.scanf "%d %d\n" (fun x y -> (x, y))
let scan_line () = Scanf.scanf "%s@\n" (fun s -> s)

let () =
	let t = scan_int () in
	for u = 1 to t do
		let n, m = scan_tuple () in
		let drive = Array.init n (fun i -> scan_line ()) in
		let todo = Array.init m (fun i -> scan_line ()) in
