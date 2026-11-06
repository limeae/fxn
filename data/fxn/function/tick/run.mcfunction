#runs a command with all contexts
#return -
#with storage fxn:cmd temp {path, x, y, z, r0, r1, dim, uuid, storage}


#check uuid
$data modify storage fxn:query uuid set value '$(uuid)'

# uuid | 0 uuid
$execute if data storage fxn:query {uuid:'0'} positioned $(x) $(y) $(z) rotated $(r0) $(r1) in $(dim) run $(cmd)
$execute as $(uuid) positioned $(x) $(y) $(z) rotated $(r0) $(r1) in $(dim) run $(cmd)
