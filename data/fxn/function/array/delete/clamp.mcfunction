#delete random values in an array until within max
#return -
#with {path, max}
#context -


#sizeof array
$execute store result score sizeof ftemp run function fxn:array/sizeof {path:"$(path)", i:0}

#if sizeof <= max, end
$scoreboard players set max ftemp $(max)
execute if score sizeof ftemp <= max ftemp run return fail
#else

#delete rand
$function fxn:array/delete/rand {path:"$(path)"}

#loops
$function fxn:array/delete/clamp {path:"$(path)", max:$(max)}
