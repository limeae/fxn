#run the schedule if each gametime matches
#return -
#with {i}
#context serverdefault

#path: "storage draft:draft example.array"
#i is the lowest value checked (set to 0)
#>array with 1 entry has size 0 (array[0])


#if missing entry, return
$execute unless data storage fxn:schedule list[$(i)] run return fail
#else

#scheduletime <= gametime
$execute store result score scheduletime ftemp run data get storage fxn:schedule list[$(i)].gametime

#if false, go next
#i++
$execute unless score scheduletime ftemp <= gametime ftemp run scoreboard players set i ftemp $(i)
execute unless score scheduletime ftemp <= gametime ftemp store result storage fxn:schedule i int 1 run scoreboard players add i ftemp 1
#loops
execute unless score scheduletime ftemp <= gametime ftemp run function fxn:pack/run_sched with storage fxn:schedule
execute unless score scheduletime ftemp <= gametime ftemp run return fail

#if true
#>entry as command
$function fxn:path {path:"storage fxn:schedule list[$(i)]"}
#loops logic
$execute store result score loops ftemp run data get storage fxn:schedule list[$(i)].loops
$execute store result storage fxn:schedule list[$(i)].loops int 1 run scoreboard players remove loops ftemp 1
#delete if -1 loops
$execute if score loops ftemp matches ..-1 run data remove storage fxn:schedule list[$(i)]
$scoreboard players set i ftemp $(i)
execute if score loops ftemp matches ..-1 run scoreboard players remove i ftemp 1
#else timedelta logic
$execute unless score loops ftemp matches ..-1 store result score scheduletime ftemp run data get storage fxn:schedule list[$(i)].timedelta
execute unless score loops ftemp matches ..-1 run scoreboard players operation scheduletime ftemp += gametime ftemp
$execute unless score loops ftemp matches ..-1 store result storage fxn:schedule list[$(i)].gametime int 1 run scoreboard players get scheduletime ftemp

#i++
execute store result storage fxn:schedule i int 1 run scoreboard players add i ftemp 1
#loops
function fxn:pack/run_sched with storage fxn:schedule
