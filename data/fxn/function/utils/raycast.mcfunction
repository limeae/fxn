#loops in a direction with a command
#return -
#with {dist, i, cmd, return}


#>command
scoreboard players set code ftemp 0
$$(cmd)

#(break | continue) code
execute if score code ftemp matches -123..-122 run return fail
#>codes: -123..-122: break
#save macros
$data modify storage fxn:cmd raycast.dist set value $(dist)
$data modify storage fxn:cmd raycast.cmd set value '$(cmd)'
#i--
$scoreboard players set i ftemp $(i)
execute if score i ftemp matches ..0 run return fail
execute store result storage fxn:cmd raycast.i int 1 run scoreboard players remove i ftemp 1

#loop
$execute positioned ^ ^ ^$(dist) run function fxn:utils/raycast with storage fxn:cmd raycast
