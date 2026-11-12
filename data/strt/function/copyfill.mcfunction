#copy the data of all blocks in the region
#return -
#with {x, y, z, rot(0 | 90 | 180 | 270)}

#new copylist
data modify storage strt:temp copylist set value []
$data modify storage strt:temp copylist append value $(x)
$data modify storage strt:temp copylist append value $(y)
$data modify storage strt:temp copylist append value $(z)
data modify storage strt:temp copylist append value []

#with rot
$data modify storage strt:temp rot set value $(rot)

#run for each block
$function strt:fill {cmd:"function strt:fill/copyfill with storage strt:temp", x:$(x), y:$(y), z:$(z), order:[x,y,z]}

#give command block
function strt:fill/give with storage strt:temp
