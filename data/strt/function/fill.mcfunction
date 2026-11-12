#run a command in the region
#return -
#with {cmd, x, y, z, order[2 (3 entries)]}
#ex: order:[y,x,z]

#save command to storage
$data modify storage strt:temp fill.cmd set value '$(cmd)'

#save xyz & temp eqvs
$scoreboard players set mx fxn $(x)
$scoreboard players set my fxn $(y)
$scoreboard players set mz fxn $(z)
$scoreboard players set x fxn $(x)
$scoreboard players set y fxn $(y)
$scoreboard players set z fxn $(z)

#save order
$data modify storage strt:temp fill.order set value $(order)
data modify storage strt:temp fill.o0 set from storage strt:temp fill.order[0]
data modify storage strt:temp fill.o1 set from storage strt:temp fill.order[1]
data modify storage strt:temp fill.o2 set from storage strt:temp fill.order[2]
#and coords
execute if data storage strt:temp fill{o0:"x"} run data modify storage strt:temp fill.c0p set value "~1 ~ ~"
execute if data storage strt:temp fill{o0:"x"} run data modify storage strt:temp fill.c0n set value "~-1 ~ ~"
execute if data storage strt:temp fill{o0:"y"} run data modify storage strt:temp fill.c0p set value "~ ~1 ~"
execute if data storage strt:temp fill{o0:"y"} run data modify storage strt:temp fill.c0n set value "~ ~-1 ~"
execute if data storage strt:temp fill{o0:"z"} run data modify storage strt:temp fill.c0p set value "~ ~ ~1"
execute if data storage strt:temp fill{o0:"z"} run data modify storage strt:temp fill.c0n set value "~ ~ ~-1"
execute if data storage strt:temp fill{o1:"x"} run data modify storage strt:temp fill.c1p set value "~1 ~ ~"
execute if data storage strt:temp fill{o1:"x"} run data modify storage strt:temp fill.c1n set value "~-1 ~ ~"
execute if data storage strt:temp fill{o1:"y"} run data modify storage strt:temp fill.c1p set value "~ ~1 ~"
execute if data storage strt:temp fill{o1:"y"} run data modify storage strt:temp fill.c1n set value "~ ~-1 ~"
execute if data storage strt:temp fill{o1:"z"} run data modify storage strt:temp fill.c1p set value "~ ~ ~1"
execute if data storage strt:temp fill{o1:"z"} run data modify storage strt:temp fill.c1n set value "~ ~ ~-1"
execute if data storage strt:temp fill{o2:"x"} run data modify storage strt:temp fill.c2p set value "~1 ~ ~"
execute if data storage strt:temp fill{o2:"x"} run data modify storage strt:temp fill.c2n set value "~-1 ~ ~"
execute if data storage strt:temp fill{o2:"y"} run data modify storage strt:temp fill.c2p set value "~ ~1 ~"
execute if data storage strt:temp fill{o2:"y"} run data modify storage strt:temp fill.c2n set value "~ ~-1 ~"
execute if data storage strt:temp fill{o2:"z"} run data modify storage strt:temp fill.c2p set value "~ ~ ~1"
execute if data storage strt:temp fill{o2:"z"} run data modify storage strt:temp fill.c2n set value "~ ~ ~-1"

#run o0
function strt:fill/0 with storage strt:temp fill

