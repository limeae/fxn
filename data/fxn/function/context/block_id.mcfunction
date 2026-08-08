#saves block id to $(namespace).block_id
#with {namespace}

#>where {namespace:  "storage draft:draft example.data"}
#block_id returns "minecraft:pumpkin", always with quotes and minecraft prefix

#summon item holder and run with it
#loaded
$execute summon item_display run function fxn:loaded {command:'function fxn:context/macro/block_id {namespace:"$(namespace)"}'}
