#do move maths on the selection
#with {index, qx, qy, qz}


#scoreboard maths
#get new values
$scoreboard players set xe ftemp $(qx)
$scoreboard players set ye ftemp $(qy)
$scoreboard players set ze ftemp $(qz)
#get values {x, y, z} subtract off of xe
$execute store result score x ftemp run data get storage tool:select list[$(index)].x
$execute store result score y ftemp run data get storage tool:select list[$(index)].y
$execute store result score z ftemp run data get storage tool:select list[$(index)].z
scoreboard players operation xe ftemp -= x ftemp
scoreboard players operation ye ftemp -= y ftemp
scoreboard players operation ze ftemp -= z ftemp
#get values {qx, qy, qz, dx, dy, dz}
$execute store result score x ftemp run data get storage tool:select list[$(index)].qx
$execute store result score y ftemp run data get storage tool:select list[$(index)].qy
$execute store result score z ftemp run data get storage tool:select list[$(index)].qz
$execute store result score dx ftemp run data get storage tool:select list[$(index)].dx
$execute store result score dy ftemp run data get storage tool:select list[$(index)].dy
$execute store result score dz ftemp run data get storage tool:select list[$(index)].dz
# range
scoreboard players operation x ftemp < xe ftemp
scoreboard players operation y ftemp < ye ftemp
scoreboard players operation z ftemp < ze ftemp
scoreboard players operation x ftemp += dx ftemp
scoreboard players operation y ftemp += dy ftemp
scoreboard players operation z ftemp += dz ftemp
scoreboard players operation x ftemp > xe ftemp
scoreboard players operation y ftemp > ye ftemp
scoreboard players operation z ftemp > ze ftemp
$execute store result storage tool:select list[$(index)].qx int 1 run scoreboard players operation x ftemp -= dx ftemp
$execute store result storage tool:select list[$(index)].qy int 1 run scoreboard players operation y ftemp -= dy ftemp
$execute store result storage tool:select list[$(index)].qz int 1 run scoreboard players operation z ftemp -= dz ftemp
#>store new qx, qy, qz -> 'storage tool:select list[$(index)].qx, qy, qz' (where they came from)
