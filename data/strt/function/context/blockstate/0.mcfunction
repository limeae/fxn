#rotate all rotating blockstates by 0* ~~~
#return -
#with {}


#get blockstate
data modify storage strt:temp blockstate set value []
#axis
execute if block ~ ~ ~ #strt:all[axis=x] run data modify storage strt:temp blockstate append value "axis=x"
execute if block ~ ~ ~ #strt:all[axis=z] run data modify storage strt:temp blockstate append value "axis=z"
#north->west
execute if block ~ ~ ~ #strt:all[north=true] run data modify storage strt:temp blockstate append value "north=true"
execute if block ~ ~ ~ #strt:all[east=true] run data modify storage strt:temp blockstate append value "east=true"
execute if block ~ ~ ~ #strt:all[south=true] run data modify storage strt:temp blockstate append value "south=true"
execute if block ~ ~ ~ #strt:all[west=true] run data modify storage strt:temp blockstate append value "west=true"
#facing
execute if block ~ ~ ~ #strt:all[facing=north] run data modify storage strt:temp blockstate append value "facing=north"
execute if block ~ ~ ~ #strt:all[facing=east] run data modify storage strt:temp blockstate append value "facing=east"
execute if block ~ ~ ~ #strt:all[facing=south] run data modify storage strt:temp blockstate append value "facing=south"
execute if block ~ ~ ~ #strt:all[facing=west] run data modify storage strt:temp blockstate append value "facing=west"
