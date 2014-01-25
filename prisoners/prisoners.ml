(* https://code.google.com/codejam/contest/189252/dashboard#s=p2 *)
let id x = x
let scan_int = Scanf.scanf " %d"
let solve prisoners =
	let q = Array.length prisoners in
	let memory = Hashtbl.create q in
	let rec inner a b =
		try
			Hashtbl.find memory (a, b)
		with Not_found ->
			let min_coins = ref 0 in
			for j = 0 to q - 1 do
				let pj = prisoners.(j) in
				if pj >= a && pj <= b then
					let coins = (b - a) + (inner a (pj - 1)) + (inner (pj + 1) b) in
					if !min_coins = 0 || coins < !min_coins then min_coins := coins
			done;
			Hashtbl.add memory (a, b) !min_coins;
			!min_coins
	in inner
	
let () =
	let n = scan_int id in
	for i = 1 to n do
		let p = scan_int id in
		let q = scan_int id in
		let prisoners = Array.make q (-1) in
		for j = 0 to q - 1 do
			let pj = scan_int id in
			prisoners.(j) <- pj
		done;
		Printf.printf "Case #%d: %d\n" i (solve prisoners 1 p)
	done
