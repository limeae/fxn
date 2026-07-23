#clone move the selection
#with {x, y, z, dx, dy, dz qx, qy, qz}

scoreboard players set -1 ftemp -1
#x += qx
$scoreboard players set x ftemp $(x)
$scoreboard players set qx ftemp $(qx)
execute store result storage tool:select op.x int 1 run scoreboard players operation x ftemp += qx ftemp
$scoreboard players set y ftemp $(y)
$scoreboard players set qy ftemp $(qy)
execute store result storage tool:select op.y int 1 run scoreboard players operation y ftemp += qy ftemp
$scoreboard players set z ftemp $(z)
$scoreboard players set qz ftemp $(qz)
execute store result storage tool:select op.z int 1 run scoreboard players operation z ftemp += qz ftemp
#dx
$data modify storage tool:select op.dx set value $(dx)
$data modify storage tool:select op.dy set value $(dy)
$data modify storage tool:select op.dz set value $(dz)
#qx *= -1
$scoreboard players set xe ftemp $(qx)
execute store result storage tool:select op.qx int 1 run scoreboard players operation xe ftemp *= -1 ftemp
$scoreboard players set ye ftemp $(qy)
execute store result storage tool:select op.qy int 1 run scoreboard players operation ye ftemp *= -1 ftemp
$scoreboard players set ze ftemp $(qz)
execute store result storage tool:select op.qz int 1 run scoreboard players operation ze ftemp *= -1 ftemp
#
function tool:op/macro/move with storage tool:select op
