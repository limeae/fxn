#gets the size of array at 'namespace'
#runs from array/get_max
#with {namespace, increment++}

#>namespace: "storage draft:draft example.array"

#
#if over max, return '1 less than 1 above max' (=max)
$execute unless data $(namespace)[$(increment)] run return run scoreboard players remove increment ftemp 1
#else

#increment++ -> 'storage fxn:array get_max.increment'
$scoreboard players set increment ftemp $(increment)
execute store result storage fxn:array get_max.increment int 1 \
    run scoreboard players add increment ftemp 1
#loop {namespace, increment++}
return run function fxn:array/macro/get_max with storage fxn:array get_max
