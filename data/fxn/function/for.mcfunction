#runs command, increments i toward end (for loop)
#return -
#with storage fxn:for {i, end, cmd}

#
#save macros for cmd
$data modify storage fxn:for i set value $(i)
$data modify storage fxn:for end set value $(end)
#>command
$$(cmd)

#break | i++ | i--
$scoreboard players set i ftemp $(i)
$scoreboard players set end ftemp $(end)
execute if score i ftemp = end ftemp run return fail
execute if score i ftemp < end ftemp store result storage fxn:for i int 1 run scoreboard players add i ftemp 1
execute if score i ftemp > end ftemp store result storage fxn:for i int 1 run scoreboard players remove i ftemp 1

#save macros
$data modify storage fxn:for end set value $(end)
$data modify storage fxn:for cmd set value '$(cmd)'

#loops
function fxn:for with storage fxn:for
