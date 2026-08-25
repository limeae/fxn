#reload

scoreboard objectives add ftemp dummy


#reset save list
data modify storage fxn:save list set value []
scoreboard players set save.list ftemp -1
