#runs for each entry in list to check if gametime <=
#with storage fxn:array cmd {decrement}


#
$execute store result score scheduletime ftemp run data get storage fxn:schedule list[$(decrement)].gametime
execute unless score scheduletime ftemp <= gametime ftemp run return fail
#else
scoreboard players set in_schedule ftemp 1
$return run function fxn:schedule/run {index:$(decrement)}
scoreboard players set in_schedule ftemp 0

