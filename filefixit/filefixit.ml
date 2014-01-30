(* http://code.google.com/codejam/contest/635101/dashboard#s=p0 *)

let scan_int () = Scanf.scanf "%d\n" (fun x -> x)
let scan_tuple () = Scanf.scanf "%d %d\n" (fun x y -> (x, y))
let scan_line () = Scanf.scanf "%s@\n" (fun s -> s)

let solve (n, m) ls_drive ls_todo =
	let drive = Hashtbl.create 7 in
	let rec mkdirs folder name =
		(* get next path part *)
		let part = try
			let idx = String.index name '/' in
			String.sub name 0 idx
			with Not_found -> name
		in try
			Hashtbl.find folder part
			with Not_found ->
				let newFolder = Hashtbl.create 7 in
				Hashtbl.add folder part newFolder;
				newFolder

let () =
	let t = scan_int () in
	for u = 1 to t do
		let n, m = scan_tuple () in
		let drive = Array.init n (fun i -> scan_line ()) in
		let todo = Array.init m (fun i -> scan_line ()) in
		let result = solve (n, m) drive todo in
