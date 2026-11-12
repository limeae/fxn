#get the block id at ~~~
#return -
#with {}


#summon item holder and run with it
execute unless entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 run summon item_display ~ ~ ~ {UUID:[I; 2131359221, 1851278838, -1506023203, -156790048]}

#get block (from silk touch)
loot replace entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 container.0 mine ~ ~ ~ diamond_pickaxe[enchantments={silk_touch:1}]
data modify storage strt:temp block set from entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 item.id
item replace entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 container.0 with air
#/!\ handle silk touch exceptions here
execute if block ~ ~ ~ air run data modify storage strt:temp block set value air
