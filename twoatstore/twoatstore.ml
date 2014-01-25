(* http://code.google.com/codejam/contest/351101/dashboard#s=p0 *)

let get_arg i =
	if Array.length Sys.argv > i
		then Some Sys.argv.(i)
		else None
let data_filename = get_arg 1
let result_filename = get_arg 2

let id x = x

let scan_int = match data_filename with
	| None -> Scanf.scanf " %d"
	| Some fn -> Scanf.fscanf (open_in fn) " %d"

let scan_result = match result_filename with
	| None -> Scanf.scanf " Case #%d: %d %d"
	| Some fn -> Scanf.fscanf (open_in fn) " Case #%d: %d %d"

let smaller_first (a, b) =
	if a <= b then a, b else b, a

let bsearch p arr =
	let rec bs left right =
		if left <= right then (
			let mid = (left + right) / 2 in
			match compare p (snd arr.(mid)) with
			| 0 -> Some mid
			| r when r > 0 -> bs (mid + 1) right
			| _ -> bs left (mid - 1)
		) else None
	in bs 0 (Array.length arr - 1)

let solve c items =
	let i = Array.length items in
	let items_i = Array.init i (fun j -> j, items.(j)) in
	Array.sort (fun a b -> compare (snd a) (snd b)) items_i;
	let result = ref None in
	begin try
		for j1 = 0 to i - 1 do
			let p1 = items.(j1) in
			let p2_target = c - p1 in
			match bsearch p2_target items_i with
			| None -> ()
			| Some k2 -> begin
				let j2 = fst items_i.(k2) in
				if j1 <> j2 then begin
					result := Some (j1, j2);
					raise Exit
				end (* else continue: binary search will find the same item
				       but j1 will be different, thus j1 will <> j2 *)
			end
		done
	with Exit -> () end;
	match !result with
	| None -> (-1), (-1)
	| Some tuple -> smaller_first tuple

let () =
	let n = scan_int id in
	for a = 1 to n do
		let c = scan_int id in
		let i = scan_int id in
		let items = Array.make i 0 in
		for j = 0 to i - 1 do
			items.(j) <- scan_int id
		done;
		match result_filename with
		| None -> let j1, j2 = solve c items in
			Printf.printf "Case #%d: %d %d\n" a (j1+1) (j2+1)
		| _ -> scan_result (fun a_ j1 j2 ->
			if a <> a_ then Printf.printf "Wrong case number, expected %d but found %d\n" a a_ else
			let p1 = items.(j1-1) in let p2 = items.(j2-1) in
			let sum = p1 + p2 in
			if sum <> c then Printf.printf "Case #%d: wrong sum, expected %d but got %d = %d + %d\n" a c sum p1 p2 else ()
			)
	done
