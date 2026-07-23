#give items


#thanks to mcstacker.net
#light blue "select"
give @p command_block[block_entity_data={id:"command_block",auto:1b,Command:"execute as @p run function fxn:list {list: ['function tool:select', 'setblock ~ ~ ~ air strict']}"},item_model="light_blue_glazed_terracotta",item_name="Select",enchantment_glint_override=true]
#magenta "move"
give @p command_block[block_entity_data={id:"command_block",auto:1b,Command:"execute as @p run function fxn:list {list: ['function tool:move', 'setblock ~ ~ ~ air strict']}"},item_model="magenta_glazed_terracotta",item_name="Move",enchantment_glint_override=true]
