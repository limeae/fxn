#check if block and blockstate within list
#return -
#with storage strt:temp current {i = 0, block, bscct}

#i++ for the next iteration
$scoreboard players set i fxn $(i)
execute store result storage strt:temp current.i int 1 run scoreboard players add i fxn 1

#if over max size, $(i) is correct && add to list && break
#/!\e
$execute unless data storage strt:temp copylist[3][$(i)] run data modify storage strt:temp copylist append value $(i)
$execute unless data storage strt:temp copylist[3][$(i)] run return run data modify storage strt:temp copylist[3] append value {block:"$(block)", bscct:"$(bscct)"}

#else use $(i)
#check block = $(block)
$data modify storage strt:temp matches set from storage strt:temp copylist[3][$(i)].block
$execute unless data storage strt:temp {matches:"$(block)"} run return run function strt:fill/checklist with storage strt:temp current

#check bscct = $(bscct)
$data modify storage strt:temp matches set from storage strt:temp copylist[3][$(i)].bscct
$execute unless data storage strt:temp {matches:"$(bscct)"} run return run function strt:fill/checklist with storage strt:temp current

#if both match, $(i) is correct && break
$return run data modify storage strt:temp copylist append value $(i)
