#gets the size of array at 'namespace'
#with {namespace}

#>namespace: "storage draft:draft example.array"
#>WARNING: first array value is array[0] -> size returned is '0' (or 1 less, for all values)


#
#save namespace to storage
$data modify storage fxn:array get_max.namespace set value "$(namespace)"


#reset increment
execute store result storage fxn:array get_max.increment int 1 \
    run scoreboard players set increment ftemp 0

#run the loop, return result
return run function fxn:array/macro/get_max with storage fxn:array get_max

