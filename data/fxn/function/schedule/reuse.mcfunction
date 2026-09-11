#prepends a scheduled command with all given contexts, timedelta, and loops, and reuses old data
#return -
#with {merge: {timedelta, cmd | list, loops, uuid, include[], x, y, z, r0, r1, dim, storage{},tags[]}}

#example:
#function fxn:schedule {merge: {cmd:"say hi", timedelta:20, loops:2, uuid:context, include:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}
#>def: new (gives default inputs)
#>      empty | 0 (DEFAULT, gives no inputs) 
#>      reuse (efficient for reusing data, leaves old stuff if not overwritten)

#create a handle
data modify storage fxn:cmd create set from storage fxn:schedule merge
$function fxn:handle/create {path:"storage fxn:schedule merge", def:reuse, mode:set, merge:$(merge)}
execute unless data storage fxn:schedule merge.timedelta run data modify storage fxn:schedule merge.timedelta set value 0
execute unless data storage fxn:schedule merge.loops run data modify storage fxn:schedule merge.loops set value 0

#>additional contexts for schedule
#timedelta to gametime
execute store result score scheduletime ftemp run data get storage fxn:schedule merge.timedelta
#gametime in function fxn:pack/tick
execute store result storage fxn:schedule merge.gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp


#>append
data modify storage fxn:schedule list append from storage fxn:schedule merge
