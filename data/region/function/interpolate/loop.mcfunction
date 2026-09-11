#clone with interpolation
#with storage region:op {x,y,z, dx,dy,dz, var, prelative, nrelative, i}


#
#timedelta (i)
$execute store result score prevdelta ftemp run scoreboard players set currdelta ftemp $(i)
scoreboard players remove prevdelta ftemp 1
#ex: prevdelta 4, i 5
$scoreboard players operation currdelta ftemp *= q$(var) ftemp
$scoreboard players operation prevdelta ftemp *= q$(var) ftemp
scoreboard players operation currdelta ftemp /= timedelta ftemp
scoreboard players operation prevdelta ftemp /= timedelta ftemp
#ex: /= 2: prevdelta 2, i 2 -> no shift
#>if prevdelta/qx < i/qx, shift,  or if >, negative shift
$execute if score prevdelta ftemp < currdelta ftemp run function region:interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"$(prelative)", var:"$(var)", score:"add $(var)", i:$(i)}
$execute if score prevdelta ftemp > currdelta ftemp run function region:interpolate/shift {x:$(x), y:$(y), z:$(z), dx:$(dx), dy:$(dy), dz:$(dz), relative:"$(nrelative)", var:"$(var)", score:"remove $(var)", i:$(i)}

#loop to: x->y, y->z, z->x
$data modify storage region:op var set value "$(var)"
scoreboard players set success ftemp 0
execute unless score success ftemp matches 1.. store success score success ftemp \
    if data storage region:op {var:"z"} run data merge storage region:op {prelative:"~1 ~ ~", nrelative:"~-1 ~ ~", var:"x"}
execute unless score success ftemp matches 1.. store success score success ftemp \
    if data storage region:op {var:"x"} run data merge storage region:op {prelative:"~ ~1 ~", nrelative:"~ ~-1 ~", var:"y"}
execute unless score success ftemp matches 1.. store success score success ftemp \
    if data storage region:op {var:"y"} run data merge storage region:op {prelative:"~ ~ ~1", nrelative:"~ ~ ~-1", var:"z"}

#if z: i++
$scoreboard players set currdelta ftemp $(i)
execute if data storage region:op {var:"x"} store result storage region:op i int 1 run scoreboard players add currdelta ftemp 1
#if i = timedelta, END
execute if score currdelta ftemp > timedelta ftemp run return fail

scoreboard players add failsafe ftemp 1
execute if score failsafe ftemp matches 500.. run return run scoreboard players reset failsafe ftemp

#loops
function region:interpolate/loop with storage region:op
