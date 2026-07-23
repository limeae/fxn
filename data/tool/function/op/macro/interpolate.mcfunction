#clone with interpolation
#with {x, y, z, dx, dy, dz, qx, qy, qz, timedelta}


#
$data modify storage tool:interpolate schedule.x set value $(x)
$scoreboard players set x ftemp $(x)
$data modify storage tool:interpolate schedule.y set value $(y)
$scoreboard players set y ftemp $(y)
$data modify storage tool:interpolate schedule.z set value $(z)
$scoreboard players set z ftemp $(z)
$data modify storage tool:interpolate schedule.dx set value $(dx)
$scoreboard players set dx ftemp $(dx)
$data modify storage tool:interpolate schedule.dy set value $(dy)
$scoreboard players set dy ftemp $(dy)
$data modify storage tool:interpolate schedule.dz set value $(dz)
$scoreboard players set dz ftemp $(dz)
$data modify storage tool:interpolate schedule.qx set value $(qx)
$scoreboard players set xe ftemp $(qx)
$data modify storage tool:interpolate schedule.qy set value $(qy)
$scoreboard players set ye ftemp $(qy)
$data modify storage tool:interpolate schedule.qz set value $(qz)
$scoreboard players set ze ftemp $(qz)
$data modify storage tool:interpolate schedule.timedelta set value $(timedelta)
$scoreboard players set timedelta ftemp $(timedelta)
#loop with increment++
data modify storage tool:interpolate schedule.increment set value 1
scoreboard players set increment ftemp 1
#>
return run function tool:op/macro/interpolate/loop/x with storage tool:interpolate schedule
