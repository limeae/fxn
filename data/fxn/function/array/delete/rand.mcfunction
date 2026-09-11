#delete a random value in an array
#return -
#with {path}
#context -


#sizeof array
$execute store result storage fxn:array max int 1 run function fxn:array/sizeof {path:"$(path)", i:0}

#if max is 0, just delete it
$execute if data storage fxn:array {max:0} run return run data remove $(path)[0]
#else

#get rand in range
data modify storage fxn:array min set value 0
execute store result storage fxn:array i int 1 run function fxn:prefab/rand with storage fxn:array

#delete rand
$data modify storage fxn:array path set value "$(path)"
function fxn:prefab/array/delete with storage fxn:array
