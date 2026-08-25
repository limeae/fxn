#display the block marker particle at each block in the schem
#return -
#with storage fxn:array value {block_id}

#air error
$execute if data storage schem:run {air:"$(block_id)"} run return fail
#particle
$particle minecraft:block_marker{block_state:{Name:"$(block_id)"}} ~ ~ ~ 0 0 0 0 0 normal @s
