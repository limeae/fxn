#concatenate the blockstate into a string
##REQUIRED FOR SETBLOCK etc
#return -
#with {bscct = na, prev = na, i = 0}

$scoreboard players set i fxn $(i)

#copy old prev
execute if score i fxn matches 0 run data modify storage strt:temp bscct set value ""
$execute if score i fxn matches 1 run data modify storage strt:temp bscct set value "$(prev)"
$execute if score i fxn matches 2.. run data modify storage strt:temp bscct set value "$(bscct),$(prev)"

#end over list
$execute unless data storage strt:temp blockstate[$(i)] run return fail

#grab new prev
$data modify storage strt:temp prev set from storage strt:temp blockstate[$(i)]

#i++
$scoreboard players set i fxn $(i)
execute store result storage strt:temp i int 1 run scoreboard players add i fxn 1
#loop
function strt:context/blockstate/concat with storage strt:temp
