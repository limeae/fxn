#get block_id of the block in schem, run cmd
#return -
#with storage schem:run block {i, cmd}


#save block in schem
$data modify storage schem:run block.block_id set from storage schem:run schem[$(i)]
#cmd (use 'with storage schem:run block' {block_id})
$$(cmd)
