#runs associated context for all given contexts
#with {namespace}

#>namespace: "storage draft:draft example.data"
#example: {uuid:context} -> {uuid:"fe43-eob..."}
#example: {pos:[x, z, dim]} -> {x:6, z:7, dim:"minecraft:the_end"}

#
#>special contexts for "context"
$data modify $(namespace).namespace set value "$(namespace)" 
#pos:[x,y,z,r0,r1,dim] -> x,y,z,r0,r1,dim
$data modify storage fxn:matches pos set from $(namespace).pos
$execute if data storage fxn:matches {pos:context} run data modify $(namespace).pos set value [all]
$execute if data $(namespace).pos run data modify $(namespace).include set from $(namespace).pos
$execute if data $(namespace).pos run data remove $(namespace).pos
$execute if data $(namespace).include run function fxn:context/pos with $(namespace)
$execute if data $(namespace).include run data remove $(namespace).include
#uuid:context -> uuid
$data modify storage fxn:matches uuid set from $(namespace).uuid
$execute if data storage fxn:matches {uuid:context} run function fxn:context/uuid with $(namespace)
#storage:{block_id:context} -> storage:{block_id}
$data modify storage fxn:matches storage set from $(namespace).storage
$execute if data storage fxn:matches {storage:{block_id:context}} run function fxn:context/block_id {namespace:"$(namespace).storage"}
#
$data remove $(namespace).namespace
#

