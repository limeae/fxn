#clone the selection
#with {x, y, z, dx, dy, dz qx, qy, qz}


#
$execute positioned $(x) $(y) $(z) run clone ~ ~ ~ ~$(dx) ~$(dy) ~$(dz) ~$(qx) ~$(qy) ~$(qz) replace
