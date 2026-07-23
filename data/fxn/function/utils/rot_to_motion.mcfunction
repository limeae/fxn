#gives entity motion based on rotation
#with {power}


#
forceload add 0 0 0 0
$execute positioned 0.0 0.0 0.0 positioned ^ ^ ^$(power) run summon marker ~ ~ ~ {Tags:["findme"]}
data modify entity @s Motion set from entity @n[type=marker,tag=findme] Pos
kill @n[type=marker,tag=findme]
#finding the marker is currently scuffed

return 1