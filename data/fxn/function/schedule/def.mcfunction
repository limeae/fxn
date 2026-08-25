#prepends a scheduled command with all given contexts, timedelta, and loops
#with {def, merge: {timedelta, cmd, loops, uuid, include[], x, y, z, r0, r1, dim, storage{},tags[]}}

#>example:
#>function fxn:schedule {merge: {cmd:"say hi", timedelta:20, loops:2, uuid:context, include:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}
#>def: new (default) | empty | reuse

#runs fxn:cmd/create
$function fxn:cmd/create {path:"storage fxn:schedule merge", def:$(def), mode:merge, merge:$(merge)}
execute unless data storage fxn:schedule merge.timedelta run data modify storage fxn:schedule merge.timedelta set value 0
execute unless data storage fxn:schedule merge.loops run data modify storage fxn:schedule merge.loops set value 0

#>additional contexts for schedule
#timedelta to gametime
execute store result score scheduletime ftemp run data get storage fxn:schedule merge.timedelta
#gametime in function fxn:tick
execute store result storage fxn:schedule merge.gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp


#if created from another schedule, array/cmd reverse decrement
#execute if score in_schedule ftemp matches 1.. if data storage fxn:array {path:"storage fxn:schedule list"} store result score i ftemp run data get storage fxn:array i
#execute if score in_schedule ftemp matches 1.. if data storage fxn:array {path:"storage fxn:schedule list"} store result storage fxn:array i int 1 run scoreboard players remove i ftemp 1
#>probably working


#>append
data modify storage fxn:schedule list append from storage fxn:schedule merge
