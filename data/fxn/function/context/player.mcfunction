#saves player nickname to $(path).player
#return -
#with {path}

#>where {path:  "storage draft:draft example.data"  }
#>or   {path:  "entity @s custom_data"  }

#but do not save to a score!


#summon item holder and run with it
execute unless entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 run summon item_display ~ ~ ~ {UUID:[I; 2131359221, 1851278838, -1506023203, -156790048]}

#get player nickname
loot replace entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 container.0 loot fxn:context/player
$data modify $(path).player set from entity 7f09f5f5-6e58-45f6-a63b-e8ddf6a792e0 item.components."minecraft:profile".name
