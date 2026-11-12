#give the placeable command block with the copylist
#return -
#with storage strt:temp {copylist, rot}

$give @s command_block[item_name="Paste $(rot)*",block_entity_data={id:"command_block",Command:'function strt:pastefill {copylist:$(copylist), rot:$(rot)}'}]
