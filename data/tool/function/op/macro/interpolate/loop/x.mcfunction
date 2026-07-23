#clone with interpolation
#with storage tool:interpolate schedule {x,y,z, dx,dy,dz, qx, increment}


#
#timedelta (increment)
$execute store result score prevdelta ftemp run scoreboard players set currdelta ftemp $(increment)
scoreboard players remove prevdelta ftemp 1
#ex: prevdelta 4, increment 5
scoreboard players operation currdelta ftemp *= xe ftemp
scoreboard players operation prevdelta ftemp *= xe ftemp
scoreboard players operation currdelta ftemp /= timedelta ftemp
scoreboard players operation prevdelta ftemp /= timedelta ftemp
#ex: /= 2: prevdelta 2, increment 2 -> no shift
#>if prevdelta/qx < increment/qx, shift,  or if >, negative shift
$execute if score prevdelta ftemp < currdelta ftemp run function tool:op/macro/interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"~1 ~ ~", var:"x", score:"add x", increment:$(increment)}
$execute if score prevdelta ftemp > currdelta ftemp run function tool:op/macro/interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"~-1 ~ ~", var:"x", score:"remove x", increment:$(increment)}

#loop to y
function tool:op/macro/interpolate/loop/y with storage tool:interpolate schedule
