#runs save key, brings i toward end (a for loop)
#return -
#with storage fxn:for {i, end, key}


#

#store i
$scoreboard players set i ftemp $(i)
$data modify storage fxn:for i set value $(i)
#>key
$function fxn:cmd with storage fxn:save list[$(key)]

#break | i++ | i--
$scoreboard players set i ftemp $(i)
$scoreboard players set end ftemp $(end)
execute if score i ftemp = end ftemp run return fail
execute if score i ftemp < end ftemp store result storage fxn:for i int 1 run scoreboard players add i ftemp 1
execute if score i ftemp > end ftemp store result storage fxn:for i int 1 run scoreboard players remove i ftemp 1

#save macros
$data modify storage fxn:for end set value $(end)
$data modify storage fxn:for key set value '$(key)'

#loops
function fxn:for/key with storage fxn:for
