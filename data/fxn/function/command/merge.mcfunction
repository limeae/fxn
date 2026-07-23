#runs a command with all given contexts
#with {merge: {command, uuid, x, y, z, r0, r1, dim, storage{}}}


#
#save merge to storage
$data modify storage fxn:command merge set value $(merge)

#>defaults if not provided
#command
execute unless data storage fxn:command merge.command run data modify storage fxn:command merge.command set value "say but nothing was scheduled..."
#pos
execute unless data storage fxn:command merge.x run data modify storage fxn:command merge.x set value 0
execute unless data storage fxn:command merge.y run data modify storage fxn:command merge.y set value 0
execute unless data storage fxn:command merge.z run data modify storage fxn:command merge.z set value 0
#rot
execute unless data storage fxn:command merge.r0 run data modify storage fxn:command merge.r0 set value 0
execute unless data storage fxn:command merge.r1 run data modify storage fxn:command merge.r1 set value 0
#dim
execute unless data storage fxn:command merge.dim run data modify storage fxn:command merge.dim set value "minecraft:overworld"
#uuid
execute unless data storage fxn:command merge.dim run data modify storage fxn:command merge.uuid set value 0
#storage
execute unless data storage fxn:command merge.storage run data modify storage fxn:command merge.storage set value 0

#>pass a full list of contexts to command/handle
#run command/handle with storage fxn:command merge {command, x, y, z, r0, r1, dim, uuid, storage}
return run function fxn:command/handle with storage fxn:command merge

