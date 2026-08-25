#gives entity motion based on rotation
#return -
#with {power}


#loaded
scoreboard players set loaded ftemp 0
execute unless block 0 0 0 test_block run scoreboard players set loaded ftemp 1
execute if score loaded ftemp matches 0 run forceload add 0 0 0 0

#>run with homeboy marker
execute unless entity cfac76b4-30ec-45f6-952f-2d9400d4dbec run summon marker ~ ~ ~ {UUID:[-810781004, 820790774, -1792070252, 13949932]}
$execute positioned 0.0 0.0 0.0 run tp cfac76b4-30ec-45f6-952f-2d9400d4dbec ^ ^ ^$(power)
execute store result score return ftemp run data modify entity @s Motion set from entity cfac76b4-30ec-45f6-952f-2d9400d4dbec Pos

#>SCHEDULE UNLOAD
execute if score loaded ftemp matches 0 run forceload remove 0 0 0 0
return run scoreboard players get return ftemp
