#extends the selection
#with {index, x, y, z}


#scoreboard maths
#get new values
$scoreboard players set xe ftemp $(x)
$scoreboard players set ye ftemp $(y)
$scoreboard players set ze ftemp $(z)
#get values {x, y, z, dx, dy, dz}
$execute store result score x ftemp run data get storage tool:select list[$(index)].x
$execute store result score y ftemp run data get storage tool:select list[$(index)].y
$execute store result score z ftemp run data get storage tool:select list[$(index)].z
$execute store result score dx ftemp run data get storage tool:select list[$(index)].dx
$execute store result score dy ftemp run data get storage tool:select list[$(index)].dy
$execute store result score dz ftemp run data get storage tool:select list[$(index)].dz
#check if xe greater than 'x2' (=x+dx)
scoreboard players operation dx ftemp += x ftemp
scoreboard players operation dy ftemp += y ftemp
scoreboard players operation dz ftemp += z ftemp
scoreboard players operation dx ftemp > xe ftemp
scoreboard players operation dy ftemp > ye ftemp
scoreboard players operation dz ftemp > ze ftemp
#check if xe less than x
$execute store result storage tool:select list[$(index)].x int 1 run scoreboard players operation x ftemp < xe ftemp
$execute store result storage tool:select list[$(index)].y int 1 run scoreboard players operation y ftemp < ye ftemp
$execute store result storage tool:select list[$(index)].z int 1 run scoreboard players operation z ftemp < ze ftemp
#continue: xe greater than 'x2' (=x+dx)
$execute store result storage tool:select list[$(index)].dx int 1 run scoreboard players operation dx ftemp -= x ftemp
$execute store result storage tool:select list[$(index)].dy int 1 run scoreboard players operation dy ftemp -= y ftemp
$execute store result storage tool:select list[$(index)].dz int 1 run scoreboard players operation dz ftemp -= z ftemp
#>store new x, y, z, dx, dy, dz -> 'storage tool:select list[$(index)].x,y,...dz' (where they came from)
return 1