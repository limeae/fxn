#prepends a scheduled command with all given contexts, timedelta, and loops
#while keeping previous data in the namespace
#with {merge: {timedelta, command, loops, uuid, pos{}, x, y, z, r0, r1, dim, storage{},tags[]}}

#>example:
#>function fxn:schedule {merge: {command:"say hi", timedelta:20, loops:2, uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}


#runs fxn:command/create/reuse with extra args
$function fxn:command/create/reuse {namespace:"storage fxn:schedule merge", merge:$(merge)}


#>additional contexts for schedule
#timedelta to gametime
execute store result score scheduletime ftemp run data get storage fxn:schedule merge.timedelta
#gametime in function fxn:tick
execute store result storage fxn:schedule merge.gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp


#if created from another schedule, array/cmd reverse decrement
execute if score in_schedule ftemp matches 1.. if data storage fxn:array {cmd:{namespace:"storage fxn:schedule list"}} store result score decrement ftemp run data get storage fxn:array cmd.decrement
execute if score in_schedule ftemp matches 1.. if data storage fxn:array {cmd:{namespace:"storage fxn:schedule list"}} store result storage fxn:array cmd.decrement int 1 run scoreboard players add decrement ftemp 1
#>probably working


#>prepend
return run data modify storage fxn:schedule list prepend from storage fxn:schedule merge

