#runs a command with:
#with {command, x, y, z, r0, r1, dim}

#
$execute positioned $(x) $(y) $(z) rotated $(r0) $(r1) in $(dim) run return run $(command)

#note: ~ and ^ are useless in schedule, since server runs from 0 0 0