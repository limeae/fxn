#appends an array to another array
#with {from NAMESPACE, to NAMESPACE}

#>namespace: "storage draft:draft example.array"


#
#save to and from to storage
$data modify storage fxn:array append.from set value "$(from)"
$data modify storage fxn:array append.to set value "$(to)"


#reset increment
execute store result storage fxn:array append.increment int 1 \
    run scoreboard players set increment ftemp 0

#append from[0, 1, 2,...] {from NAMESPACE, to NAMESPACE, increment}
return run function fxn:array/macro/append with storage fxn:array append

