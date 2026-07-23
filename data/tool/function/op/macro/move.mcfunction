#clone move the selection
#with {x, y, z, dx, dy, dz qx, qy, qz}


#
$return run execute positioned $(x) $(y) $(z) run clone ~ ~ ~ ~$(dx) ~$(dy) ~$(dz) ~$(qx) ~$(qy) ~$(qz) replace move
