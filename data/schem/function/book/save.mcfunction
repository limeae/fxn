#saves the current block to the generated schem
#return -
#with {}

#get block_id (no blockstate)
function fxn:context/block_id {path:"storage schem:save block"}
data modify storage schem:save schem append from storage schem:save block.block_id
