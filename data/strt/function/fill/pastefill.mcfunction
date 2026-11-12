#paste the block
#return -
#with storage strt:temp paste {i = 4}

#end if over list
$execute unless data storage strt:main paste.copylist[$(i)] run return fail

#get index
$data modify storage strt:temp paste.index set from storage strt:main paste.copylist[$(i)]
#run index
function strt:fill/paste with storage strt:temp paste

#i++ for next block
$scoreboard players set i fxn $(i)
execute store result storage strt:temp paste.i int 1 run scoreboard players add i fxn 1
