#give a bee nest with command
#return -
#with {cmd}

$give @s bee_nest[lore=["$(cmd)"],bees=[{min_ticks_in_hive:2147483647,ticks_in_hive:0,entity_data:{id:"minecraft:bee",Tags:["cmd"],data:{cmd:'$(cmd)'}}}]]
