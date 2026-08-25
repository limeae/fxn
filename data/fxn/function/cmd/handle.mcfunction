#runs cmd with all contexts
#return -
#with {cmd, x, y, z, r0, r1, dim, uuid, storage}


#
#check uuid and storage
$data modify storage fxn:matches uuid set value '$(uuid)'
$data modify storage fxn:matches storage set value $(storage)

# uuid | 0 uuid  ||  storage | 0 storage
$execute if data storage fxn:matches {uuid:'0'} if data storage fxn:matches {storage:0} \
    in $(dim) positioned $(x) $(y) $(z) rotated $(r0) $(r1) run $(cmd)
$execute unless data storage fxn:matches {uuid:'0'} if data storage fxn:matches {storage:0} \
    in $(dim) positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run $(cmd)
$execute if data storage fxn:matches {uuid:'0'} unless data storage fxn:matches {storage:0} \
    in $(dim) positioned $(x) $(y) $(z) rotated $(r0) $(r1) run function fxn:cmd {cmd:'$(cmd) $(storage)'}
$execute unless data storage fxn:matches {uuid:'0'} unless data storage fxn:matches {storage:0} \
    in $(dim) positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run function fxn:cmd {cmd:'$(cmd) $(storage)'}

