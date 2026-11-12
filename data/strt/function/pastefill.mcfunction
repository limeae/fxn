#paste all blocks in the copylist
#return -
#with {copylist, rot(0 | 90 | 180 | 270)}

#save copylist
$data modify storage strt:main paste.copylist set value $(copylist)
#get y
data modify storage strt:main paste.y set from storage strt:main paste.copylist[1]
#get xz order
scoreboard players set -1 fxn -1
$scoreboard players set rot fxn $(rot)
execute store result score x fxn run data get storage strt:main paste.copylist[0]
execute store result score z fxn run data get storage strt:main paste.copylist[2]
execute if score rot fxn matches 0 store result storage strt:main paste.x int 1 run scoreboard players get x fxn
execute if score rot fxn matches 0 store result storage strt:main paste.z int 1 run scoreboard players get z fxn
execute if score rot fxn matches 270 store result storage strt:main paste.x int 1 run scoreboard players get z fxn
execute if score rot fxn matches 270 store result storage strt:main paste.z int 1 run scoreboard players operation x fxn *= -1 fxn
execute if score rot fxn matches 180 store result storage strt:main paste.x int 1 run scoreboard players operation x fxn *= -1 fxn
execute if score rot fxn matches 180 store result storage strt:main paste.z int 1 run scoreboard players operation z fxn *= -1 fxn
execute if score rot fxn matches 90 store result storage strt:main paste.x int 1 run scoreboard players operation z fxn *= -1 fxn
execute if score rot fxn matches 90 store result storage strt:main paste.z int 1 run scoreboard players get x fxn

execute if score rot fxn matches 0 run data modify storage strt:main paste.order set value [x,y,z]
execute if score rot fxn matches 90 run data modify storage strt:main paste.order set value [z,y,x]
execute if score rot fxn matches 180 run data modify storage strt:main paste.order set value [x,y,z]
execute if score rot fxn matches 270 run data modify storage strt:main paste.order set value [z,y,x]

#function
data modify storage strt:temp paste.i set value 4
data modify storage strt:main paste.cmd set value "function strt:fill/pastefill with storage strt:temp paste"

#run for each block
function strt:fill with storage strt:main paste
