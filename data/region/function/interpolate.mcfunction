#move one region to an offset over time
#return -
#with {x, y, z, dx, dy, dz, qx, qy, qz, timedelta}


$data modify storage region:op x set value $(x)
$scoreboard players set x ftemp $(x)
$data modify storage region:op y set value $(y)
$scoreboard players set y ftemp $(y)
$data modify storage region:op z set value $(z)
$scoreboard players set z ftemp $(z)
$data modify storage region:op dx set value $(dx)
$scoreboard players set dx ftemp $(dx)
$data modify storage region:op dy set value $(dy)
$scoreboard players set dy ftemp $(dy)
$data modify storage region:op dz set value $(dz)
$scoreboard players set dz ftemp $(dz)
$data modify storage region:op qx set value $(qx)
$scoreboard players set qx ftemp $(qx)
$data modify storage region:op qy set value $(qy)
$scoreboard players set qy ftemp $(qy)
$data modify storage region:op qz set value $(qz)
$scoreboard players set qz ftemp $(qz)
$data modify storage region:op timedelta set value $(timedelta)
$scoreboard players set timedelta ftemp $(timedelta)
#loops
data modify storage region:op i set value 1
scoreboard players set i ftemp 1
data merge storage region:op {prelative:"~1 ~ ~", nrelative:"~-1 ~ ~", var:"x"}

function region:interpolate/loop with storage region:op

