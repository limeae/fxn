#save entry index -> 'storage tool:select entry.index'
#with storage fxn:array cmd {namespace, decrement}


#
execute unless data storage fxn:array {cmd:{namespace:"storage tool:select list"}} run return run say not referencing list!

#find uuid match, return the entry number
#>get entry's uuid -> 'storage fxn:matches uuid'
$data modify storage fxn:matches uuid set from $(namespace)[$(decrement)].uuid
$data modify storage fxn:matches return set value 'return run data modify storage tool:select entry.index set value $(decrement)'
#>check against current player uuid
return run function fxn:matches/uuid with storage fxn:matches

