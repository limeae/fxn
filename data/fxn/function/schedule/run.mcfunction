#(from array/macro/cmd) run handle if gametime matches
#with storage fxn:array {i, value}


#
#get time
execute store result score scheduletime ftemp run data get storage fxn:array value.gametime
#if scheduletime <= gametime
#>run
execute unless score scheduletime ftemp <= gametime ftemp run return fail
scoreboard players set schedulecode ftemp 0
function fxn:cmd/path {path:"storage fxn:array value"}

#loops--
execute store result score loops ftemp run data get storage fxn:array value.loops
scoreboard players remove loops ftemp 1
#delete original if has 0 loops
#>or code -123..-122 delete
execute unless data storage fxn:array value.cmd run return run scoreboard players set code ftemp -121
execute if score loops ftemp matches -1 run return run scoreboard players set code ftemp -121
execute if score schedulecode ftemp matches -123..-122 run return run scoreboard players set code ftemp -121
#else

#write loops-- to original
$execute store result storage fxn:schedule list[$(i)].loops int 1 run scoreboard players get loops ftemp
#redo gametime
execute store result score scheduletime ftemp run data get storage fxn:array value.timedelta
#gametime in function fxn:tick
$execute store result storage fxn:schedule list[$(i)].gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp
