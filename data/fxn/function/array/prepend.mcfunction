#prepend an array to another array
#with {from NAMESPACE, to NAMESPACE}

#>namespace: "storage draft:draft example.array"


#
#save to and from to storage
$data modify storage fxn:array prepend.from set value "$(from)"
$data modify storage fxn:array prepend.to set value "$(to)"

#get max -> 'score decrement ftemp', 'storage fxn:array delete_value.decrement'
$execute store result score decrement ftemp \
store result storage fxn:array prepend.decrement int 1 \
    run function fxn:array/get_max {namespace:"$(from)"}


#prepend from[0, 1, 2,...] {from NAMESPACE, to NAMESPACE, decrement}
return run function fxn:array/macro/prepend with storage fxn:array prepend

