#runs from function schedule:context/block as the item display
#with {namespace}

#>where {namespace:  "storage draft:draft example.data"}


#
#get block if loot
loot replace entity @s container.0 mine ~ ~ ~ stick[enchantments={silk_touch:1}]
$execute if data entity @s item run data modify $(namespace).block.id set from entity @s item.id
kill @s

#also check for other blocks
$execute if block ~ ~ ~ barrier run data modify $(namespace).block.id set value barrier
$execute if block ~ ~ ~ command_block run data modify $(namespace).block.id set value command_block
#>add more here

