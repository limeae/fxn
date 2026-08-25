#tp the player in or out of tool:view
#


#
#unless in tool:view
execute unless data entity @s {Dimension:"tool:view"} run return run function fxn:list {list: [\
    'summon item ~ ~ ~ {PickupDelay:0,Item:{id:chorus_fruit,components:{"minecraft:enchantment_glint_override":1b,"minecraft:custom_data":{dim:"tool:view"}}}}', \
    'data modify entity @n[type=item] Item.components."minecraft:custom_data".dim set from entity @s Dimension', \
    'execute in tool:view run tp ~ ~ ~', \
    'execute as @n[type=item] in tool:view run tp ~ ~ ~']}

#if in tool:view
execute if data entity @s {Dimension:"tool:view"} run return run function fxn:list {list: [\
    'function tool:macro/tp with entity @s Inventory[{id:"minecraft:chorus_fruit",components:{"minecraft:enchantment_glint_override":1b}}].components."minecraft:custom_data"', \
    'clear @s chorus_fruit[enchantment_glint_override=1b]']}
