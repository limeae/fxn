#set the block at each block in the schem
#return -
#with storage fxn:array value {block_id}

#air error
#$execute if data storage schem:run {air:"$(block_id)"} run return fail
#setblock
$setblock ~ ~ ~ $(block_id)
