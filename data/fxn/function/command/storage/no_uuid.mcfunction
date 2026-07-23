#runs a command with storage:
#with {command, x, y, z, r0, r1, dim, storage{}}

#>storage: {macro1:77, macro2:"big_text"}
    #>or "with storage draft:draft example.data"

#>only with /function (no slash tho)
$execute positioned $(x) $(y) $(z) rotated $(r0) $(r1) in $(dim) run return run $(command) $(storage)

#note: ~ and ^ are useless in schedule, since server runs from 0 0 0