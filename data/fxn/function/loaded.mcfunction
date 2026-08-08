#tries to load and unload the current position
#with {command}


#
#check if loaded
scoreboard players set loaded ftemp 0
execute if loaded ~ ~ ~ run scoreboard players set loaded ftemp 1

#load if not loaded
execute if score loaded ftemp matches 0 run forceload add ~ ~ ~ ~

#>command
$$(command)

#unload if prev not loaded
execute if score loaded ftemp matches 0 run forceload remove ~ ~ ~ ~
