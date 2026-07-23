#delete a random entry in an array
#with {namespace}

#>namespace: "storage draft:draft example.array"



#save namespace to storage
$data modify storage fxn:array delete.namespace set value "$(namespace)"

#get max -> 'storage fxn:array delete.max'
$execute store result storage fxn:array delete.max int 1 \
    run function fxn:array/get_max {namespace:"$(namespace)"}


#get rand within max [0, max] inclus. -> 'storage fxn:array delete.rand'
execute store result storage fxn:array delete.rand int 1 run function fxn:utils/rand_0 with storage fxn:array delete

#delete rand entry {namespace, rand INT}
function fxn:array/macro/delete/rand with storage fxn:array delete

return 1
