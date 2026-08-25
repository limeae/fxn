#deletes a random value in the pathed array until max size is met
#return -
#with {path, i}

#>i max size


#array check
$execute unless data $(path)[0] run return fail
#sizeof check
$execute store result score sizeof ftemp run function fxn:array/sizeof {path:"$(path)"}
$scoreboard players set i ftemp $(i)
execute if score sizeof ftemp <= i ftemp run return 1
#else

#>delete rand
$function fxn:array/delete/rand {path:"$(path)"}

#save macros
$data modify storage fxn:array i set value $(i)
$data modify storage fxn:array path set value "$(path)"

#loops
function fxn:array/delete/clamp with storage fxn:array
