(* http://code.google.com/codejam/contest/635101/dashboard#s=p0 *)

let scan_int () = Scanf.scanf "%d\n" (fun x -> x)
let scan_tuple () = Scanf.scanf "%d %d\n" (fun x y -> (x, y))
let scan_line () = Scanf.scanf "%s@\n" (fun s -> s)

let partition s c =
	try
		let idx = String.index s c
		in String.sub s 0 idx, String.sub s (1 + idx) (String.length s - 1 - idx)
	with Not_found -> s, ""

let clean name =
	let idx = String.index name '/' in
	if idx = 0 then String.sub name 1 (String.length name - 1)
	else raise Not_found

(* necessary for defining a recursive type *)
type folder_t = Folder of (string, folder_t) Hashtbl.t

let get_folder (Folder f) = f

let rec mkdirs count folder name =
	let (part, rest) = partition name '/' in
	let subfolder =
		(try Hashtbl.find (get_folder folder) part
		with Not_found ->
			let newFolder = Folder (Hashtbl.create 7)
			in Hashtbl.add (get_folder folder) part newFolder;
			incr count;
			newFolder) in
	if String.length rest > 0
	then mkdirs count subfolder rest

let solve (n, m) ls_drive ls_todo =
	let drive = Folder (Hashtbl.create 7) in
	Array.iter (mkdirs (ref 0) drive) (Array.map clean ls_drive);
	let count = ref 0 in
	Array.iter (mkdirs count drive) (Array.map clean ls_todo);
	!count

let () =
	let t = scan_int () in
	for u = 1 to t do
		let n, m = scan_tuple () in
		let drive = Array.init n (fun i -> scan_line ()) in
		let todo = Array.init m (fun i -> scan_line ()) in
		let result = solve (n, m) drive todo in
		Printf.printf "Case #%d: %d\n" u result
	done
