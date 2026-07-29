#clones selection region to q-region from current position
#with {timedelta, dx, dy, dz, qx, qy, qz}

#ran at the xyz


#save macros to storage
$data modify storage tool:interpolate merge.timedelta set value $(timedelta)
$data modify storage tool:interpolate merge.dx set value $(dx)
$data modify storage tool:interpolate merge.dy set value $(dy)
$data modify storage tool:interpolate merge.dz set value $(dz)
$data modify storage tool:interpolate merge.qx set value $(qx)
$data modify storage tool:interpolate merge.qy set value $(qy)
$data modify storage tool:interpolate merge.qz set value $(qz)
#get xyz
function fxn:context/pos_int {namespace:"storage tool:interpolate merge", include:[x, y, z]}

#>run with storage
function tool:op/macro/interpolate with storage tool:interpolate merge
