#saves block id to $(path).block_id
#return -
#with {path}

#>where {path:  "storage draft:draft example.data"}
#block_id returns "minecraft:pumpkin", always with quotes and minecraft prefix

#check for other blocks
$execute if block ~ ~ ~ barrier run return run data modify $(path).block_id set value barrier
$execute if block ~ ~ ~ command_block run return run data modify $(path).block_id set value command_block
#>add more here
#else

#run as item holder
execute unless entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 run summon item_display ~ ~ ~ {UUID:[I; 2131359221, 1851278838, -1506023203, -156790048]}
#try to get block loot
loot replace entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 container.0 mine ~ ~ ~ stick[enchantments={silk_touch:1}]
$execute as 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 if data entity @s item run data modify $(path).block_id set from entity @s item.id
#clear item
item replace entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 container.0 with air
