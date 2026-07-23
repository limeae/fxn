#do move maths on the selection
#with {index, qx, qy, qz}


#scoreboard maths
#get new values
$scoreboard players set xe ftemp $(qx)
$scoreboard players set ye ftemp $(qy)
$scoreboard players set ze ftemp $(qz)
#get values {qx, qy, qz}
$execute store result score x ftemp run data get storage tool:select list[$(index)].qx
$execute store result score y ftemp run data get storage tool:select list[$(index)].qy
$execute store result score z ftemp run data get storage tool:select list[$(index)].qz
#add onto
$execute store result storage tool:select list[$(index)].qx int 1 run scoreboard players operation x ftemp += xe ftemp
$execute store result storage tool:select list[$(index)].qy int 1 run scoreboard players operation y ftemp += ye ftemp
$execute store result storage tool:select list[$(index)].qz int 1 run scoreboard players operation z ftemp += ze ftemp
#>store new qx, qy, qz -> 'storage tool:select list[$(index)].qx, qy, qz' (where they came from)
