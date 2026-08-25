#change the blocks 'facing' blockstate to rotation
#with {from, to}

#90*

#
#facing check
$execute unless block ~ ~ ~ #tool:facing[facing=$(from)] run return fail
#else

#get block id
function fxn:context/block_id {namespace:"storage tool:blockstate facing"}
#save blockstates
$data modify storage tool:blockstate facing.blockstate set value "[facing=$(to)"


#>
#function tool:macro/blockstate with storage tool:blockstate facing
