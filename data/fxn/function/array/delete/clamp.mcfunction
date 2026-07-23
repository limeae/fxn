#delete random entries in an array until array is within max size
#with {namespace, max INT}

#>namespace: "storage draft:draft example.array"


#save max to score
$scoreboard players set max ftemp $(max)

#get max -> 'score matches ftemp'
$execute store result score matches ftemp \
    run function fxn:array/get_max {namespace:"$(namespace)"}
execute if score matches ftemp <= max ftemp run return 1
#>END if array within max size
#else delete rand and loop
$function fxn:array/delete/rand {namespace:"$(namespace)"}
#>loop
$function fxn:array/delete/clamp {namespace:"$(namespace)",max:$(max)}
#loops
