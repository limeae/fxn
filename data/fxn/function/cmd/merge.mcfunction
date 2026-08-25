#runs cmd with all given contexts
#return -
#with {merge{cmd, x, y, z, r0, r1, dim, uuid, storage}}


#
#default
function fxn:cmd/create/default {path:"storage fxn:cmd merge"}
#>merge
$data modify storage fxn:cmd merge merge value $(merge)

#>run handle
function fxn:cmd/handle with storage fxn:cmd merge
