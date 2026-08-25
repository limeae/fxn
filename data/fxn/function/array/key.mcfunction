#runs a save key for each entry in the pathed array
#return -
#with storage fxn:array {path, key, i}

#path: "storage draft:draft example.array"
#i is the lowest value checked (set to 0)
#>array with 1 entry has size 0 (array[0])


#if missing entry, return sum
$execute unless data $(path)[$(i)] run return fail
#else

#store i and value
$scoreboard players set i ftemp $(i)
$data modify storage fxn:array i set value $(i)
$data modify storage fxn:array value set from $(path)[$(i)]
#>key
$function fxn:cmd with storage fxn:save list[$(key)]

#save macros
$data modify storage fxn:array path set value "$(path)"
$data modify storage fxn:array key set value $(key)

#i++
$scoreboard players set i ftemp $(i)
execute store result storage fxn:array i int 1 run scoreboard players add i ftemp 1

#loops
function fxn:array/key with storage fxn:array
