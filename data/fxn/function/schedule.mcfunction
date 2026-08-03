#runs a schedules command with all given contexts and timedelta
#with {merge: {timedelta, command, loops, uuid, pos{}, x, y, z, r0, r1, dim, storage{},tags[]}}

#>example:
#>function fxn:schedule {merge: {command:"say hi", timedelta:20, loops:2, uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}


#
#save merge to storage
$data modify storage fxn:schedule merge set value $(merge)

#>defaults if not provided
#command
execute unless data storage fxn:schedule merge.command run data modify storage fxn:schedule merge.command set value "say but nothing was scheduled..."
#loops
execute unless data storage fxn:schedule merge.loops run data modify storage fxn:schedule merge.loops set value 1
#pos
execute unless data storage fxn:schedule merge.x run data modify storage fxn:schedule merge.x set value 0
execute unless data storage fxn:schedule merge.y run data modify storage fxn:schedule merge.y set value 0
execute unless data storage fxn:schedule merge.z run data modify storage fxn:schedule merge.z set value 0
#rot
execute unless data storage fxn:schedule merge.r0 run data modify storage fxn:schedule merge.r0 set value 0
execute unless data storage fxn:schedule merge.r1 run data modify storage fxn:schedule merge.r1 set value 0
#dim
execute unless data storage fxn:schedule merge.dim run data modify storage fxn:schedule merge.dim set value "minecraft:overworld"
#uuid
execute unless data storage fxn:schedule merge.uuid run data modify storage fxn:schedule merge.uuid set value 0
#storage
execute unless data storage fxn:schedule merge.storage run data modify storage fxn:schedule merge.storage set value 0


#>special contexts for "context"
data modify storage fxn:schedule merge.namespace set value "storage fxn:schedule merge" 
#pos:[x,y,z,r0,r1,dim] -> x,y,z,r0,r1,dim
execute if data storage fxn:schedule {merge:{pos:context}} run data modify storage fxn:schedule merge.pos set value [all]
execute if data storage fxn:schedule merge.pos run data modify storage fxn:schedule merge.include set from storage fxn:schedule merge.pos
execute if data storage fxn:schedule merge.pos run data remove storage fxn:schedule merge.pos
execute if data storage fxn:schedule merge.include run function fxn:context/pos with storage fxn:schedule merge
execute if data storage fxn:schedule merge.include run data remove storage fxn:schedule merge.include
#uuid:context -> uuid
execute if data storage fxn:schedule {merge:{uuid:context}} run function fxn:context/uuid with storage fxn:schedule merge
#storage:{block:context} -> storage:{block}
execute if data storage fxn:schedule {merge:{storage:{block:context}}} run function fxn:context/block with storage fxn:schedule merge.storage
#
data remove storage fxn:schedule merge.namespace
#

#>timedelta to gametime
execute store result score scheduletime ftemp run data get storage fxn:schedule merge.timedelta
#gametime in function schedule:tick
execute store result storage fxn:schedule merge.gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp


#if created from another schedule, array/cmd reverse decrement
execute if score in_schedule ftemp matches 1.. if data storage fxn:array {cmd:{namespace:"storage fxn:schedule list"}} store result score decrement ftemp run data get storage fxn:array cmd.decrement
execute if score in_schedule ftemp matches 1.. if data storage fxn:array {cmd:{namespace:"storage fxn:schedule list"}} store result storage fxn:array cmd.decrement int 1 run scoreboard players add decrement ftemp 1
#>may not be working

#>prepend
return run data modify storage fxn:schedule list prepend from storage fxn:schedule merge

