#runs associated context for all given contexts
#return -
#with {path}

#example: path {uuid:context} -> {uuid:"fe43-eob..."}
#example: path {pos:[x, z, dim]} -> {x:6, z:7, dim:"minecraft:the_end"}

#
#>special contexts for "context"
$data modify $(path).path set value "$(path)" 
#include:[x,y,z,r0,r1,dim] -> x,y,z,r0,r1,dim
$execute if data $(path).pos run data modify $(path).include set from $(path).pos
$execute if data $(path).include run function fxn:context/pos with $(path)
$execute if data $(path).include run data remove $(path).include
#uuid:context -> uuid
$execute if data $(path).uuid run data modify storage fxn:matches uuid set from $(path).uuid
$execute if data $(path).uuid if data storage fxn:matches {uuid:context} run function fxn:context/uuid with $(path)

$data remove $(path).path
#
