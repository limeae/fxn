#command bees but south
#return -
#with {}
#from advancement break_bees/*

advancement revoke @s only fxn:bees/south

#save command to storage
data modify storage fxn:temp bee.cmd set from entity @n[type=bee,tag=cmd] data.cmd

#run with command
execute positioned as @n[type=bee,tag=cmd] positioned ~ ~ ~-1 run function fxn:cmd with storage fxn:temp bee

#remove the bee
tp @n[type=bee,tag=cmd] ~ -300 ~
stopsound @a * block.beehive.exit
