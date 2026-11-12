#get all non-rotating blockstates at ~~~
#return -
#with {}


#useless:half
execute if block ~ ~ ~ #strt:all[half=top] run data modify storage strt:temp blockstate append value "half=top"
#useless:shape
execute if block ~ ~ ~ #strt:all[shape=inner_left] run data modify storage strt:temp blockstate append value "shape=inner_left"
execute if block ~ ~ ~ #strt:all[shape=inner_right] run data modify storage strt:temp blockstate append value "shape=inner_right"
execute if block ~ ~ ~ #strt:all[shape=outer_left] run data modify storage strt:temp blockstate append value "shape=outer_left"
execute if block ~ ~ ~ #strt:all[shape=outer_right] run data modify storage strt:temp blockstate append value "shape=outer_right"
#useless:type
execute if block ~ ~ ~ #strt:all[type=top] run data modify storage strt:temp blockstate append value "type=top"
#useless:waterlogged
execute if block ~ ~ ~ #strt:all[waterlogged=true] run data modify storage strt:temp blockstate append value "waterlogged=true"
#/!\ get all of the other useless ones!
