#clone with interpolation
#with storage tool:interpolate schedule {x,y,z, dx,dy,dz, qz, increment}


#
#timedelta (increment)
$execute store result score prevdelta ftemp run scoreboard players set currdelta ftemp $(increment)
scoreboard players remove prevdelta ftemp 1
#ex: prevdelta 4, increment 5
scoreboard players operation currdelta ftemp *= ze ftemp
scoreboard players operation prevdelta ftemp *= ze ftemp
scoreboard players operation currdelta ftemp /= timedelta ftemp
scoreboard players operation prevdelta ftemp /= timedelta ftemp
#ex: /= 2: prevdelta 2, increment 2 -> no shift
#>if prevdelta/qx < increment/qx, shift,  or if >, negative shift
$execute if score prevdelta ftemp < currdelta ftemp run function tool:op/macro/interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"~ ~ ~1", var:"z", score:"add z", increment:$(increment)}
$execute if score prevdelta ftemp > currdelta ftemp run function tool:op/macro/interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"~ ~ ~-1", var:"z", score:"remove z", increment:$(increment)}

#increment++
$scoreboard players set currdelta ftemp $(increment)
execute store result storage tool:interpolate schedule.increment int 1 run scoreboard players add currdelta ftemp 1
#if increment = timedelta, END
execute if score currdelta ftemp > timedelta ftemp run return fail
#loop to x with increment++
function tool:op/macro/interpolate/loop/x with storage tool:interpolate schedule

