#runs a command with all contexts
#return -
#with storage fxn:cmd temp {path, x, y, z, r0, r1, dim, uuid, storage}
#context [uuid*] *iff provided uuid is 0

#>always use fxn:handle
#if storage is not 0, cmd must be a function
#cmd can be a command | handle | list (ik handles in handles are useless)


#check uuid  storage  dim
$data modify storage fxn:cmd uuid set value '$(uuid)'
$data modify storage fxn:cmd storage set value $(storage)
$data modify storage fxn:cmd dim set value "$(dim)"

# uuid | 0 uuid  ||  storage | 0 storage || dim | 0 dim
$execute if data storage fxn:cmd {uuid:'0'} if data storage fxn:cmd {storage:0} if data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) run function fxn:path {path:"$(path)"}
$execute unless data storage fxn:cmd {uuid:'0'} if data storage fxn:cmd {storage:0} if data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run function fxn:path {path:"$(path)"}

$execute if data storage fxn:cmd {uuid:'0'} unless data storage fxn:cmd {storage:0} if data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) run function fxn:cmd {cmd:'$(cmd) $(storage)'}
$execute unless data storage fxn:cmd {uuid:'0'} unless data storage fxn:cmd {storage:0} if data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run function fxn:cmd {cmd:'$(cmd) $(storage)'}


$execute if data storage fxn:cmd {uuid:'0'} if data storage fxn:cmd {storage:0} unless data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) run function fxn:cmd {cmd:'execute in $(dim) run function fxn:path {path:"$(path)"}'}
$execute unless data storage fxn:cmd {uuid:'0'} if data storage fxn:cmd {storage:0} unless data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run function fxn:cmd {cmd:'execute in $(dim) run function fxn:path {path:"$(path)"}'}

$execute if data storage fxn:cmd {uuid:'0'} unless data storage fxn:cmd {storage:0} unless data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) run function fxn:cmd {cmd:'execute in $(dim) run function fxn:cmd {cmd:"$(cmd) $(storage)"}'}
$execute unless data storage fxn:cmd {uuid:'0'} unless data storage fxn:cmd {storage:0} unless data storage fxn:cmd {dim:"0"} \
    positioned $(x) $(y) $(z) rotated $(r0) $(r1) as $(uuid) run function fxn:cmd {cmd:'execute in $(dim) run function fxn:cmd {cmd:"$(cmd) $(storage)"}'}
