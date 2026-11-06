#runs the [i] entry in the schedule list
#return -
#with {i}


#start with i:0

#if missing entry, return
$execute unless data storage fxn:schedule list[$(i)] run return fail
#else

#i++
$scoreboard players set i fxn $(i)
execute store result storage fxn:schedule run.i int 1 run scoreboard players add i fxn 1



#save data for querying
$data modify storage fxn:schedule run.merge set from storage fxn:schedule list[$(i)]
#copy scheduletime
execute store result score scheduletime fxn run data get storage fxn:schedule run.merge.gametime
execute if score scheduletime fxn > gametime fxn run return run function fxn:tick/schedule with storage fxn:schedule run
#if above gametime, loop to next


#run
function fxn:tick/run with storage fxn:schedule run.merge


#loops--
execute store result score loops fxn run data get storage fxn:schedule run.merge.loops
scoreboard players remove loops fxn 1
#if out of loops, delete and i--
$execute if score loops fxn matches -1 run data remove storage fxn:schedule list[$(i)]
$execute if score loops fxn matches -1 run data modify storage fxn:schedule run.i set value $(i)
execute if score loops fxn matches -1 run return run function fxn:tick/schedule with storage fxn:schedule run
#if out of loops, loop to next


#else replace loops and gametime
$execute store result storage fxn:schedule list[$(i)].loops int 1 run scoreboard players get loops fxn
execute store result score scheduletime fxn run data get storage fxn:schedule run.merge.timedelta
$execute store result storage fxn:schedule list[$(i)].gametime int 1 run scoreboard players operation scheduletime fxn += gametime fxn

#loop to next
function fxn:tick/schedule with storage fxn:schedule run
