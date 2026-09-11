#shift in direction
#with {x, y, z, dx, dy, dz, relative, var, score, i}

#relative: "~ ~ ~1"
#score: "add z"

#SCHEDULE clone move shift
$function fxn:schedule {merge: {timedelta:$(i), pos:[dim], cmd: 'execute positioned $(x) $(y) $(z) run clone ~ ~ ~ ~$(dx) ~$(dy) ~$(dz) $(relative) replace move'}}
#SCHEDULE tp entities
$function fxn:schedule {merge: {timedelta:$(i), pos:[dim], cmd: 'execute as @e[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] at @s run tp @s $(relative)'}}

#x++
$execute store result storage region:op $(var) int 1 run scoreboard players $(score) ftemp 1
