#runs a command for each entry in the pathed array
#return -
#with storage fxn:array {path, cmd, i}

#path: "storage draft:draft example.array"
#i is the lowest value checked (set to 0)
#>array with 1 entry has size 0 (array[0])


#if missing entry, return
$execute unless data $(path)[$(i)] run return fail
#else

#save macros for cmd
$data modify storage fxn:array path set value "$(path)"
$data modify storage fxn:array i set value $(i)
$data modify storage fxn:array value set from $(path)[$(i)]
#>command
scoreboard players set delete ftemp 0
$$(cmd)

#save macros
$data modify storage fxn:array path set value "$(path)"
$data modify storage fxn:array cmd set value '$(cmd)'

#i++
#set delete ftemp to 1 or more for how many values have been deleted
$scoreboard players set i ftemp $(i)
execute if score delete ftemp matches 1.. run scoreboard players operation i ftemp -= delete ftemp
execute store result storage fxn:array i int 1 run scoreboard players add i ftemp 1
scoreboard players set delete ftemp 0

#loops
function fxn:array with storage fxn:array
