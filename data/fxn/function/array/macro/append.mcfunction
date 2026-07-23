#appends an array to another array
#with {from NAMESPACE, to NAMESPACE, increment++}

#>namespace: "storage draft:draft example.array"


#
#if over max 'from', end
$execute unless data $(from)[$(increment)] run return run scoreboard players remove increment ftemp 1
#else

#>append from $(increment)
$data modify $(to) append from $(from)[$(increment)]

#increment++ -> 'storage fxn:array append.increment'
$scoreboard players set increment ftemp $(increment)
execute store result storage fxn:array append.increment int 1 \
    run scoreboard players add increment ftemp 1
#loop {from NAMESPACE, to NAMESPACE, increment++}
return run function fxn:array/macro/append with storage fxn:array append
