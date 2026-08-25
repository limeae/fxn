#places rotated blocks of the schematic
#return -
#with {r0, text, mode, schem}

#>mode: particle | setblock (in schem:macro/*)
#text:1 gives the player a duplicate text chat command

#save
$data modify storage schem:run schem set value $(schem)
#get xyz
data modify storage schem:run x set from storage schem:run schem[0]
data modify storage schem:run y set from storage schem:run schem[1]
data modify storage schem:run z set from storage schem:run schem[2]
data modify storage schem:run cmd set value 'function fxn:list/path {path:"storage schem:run run.list"}'
#macro/block
scoreboard players set schem.i ftemp 2
data modify storage schem:run block.list set value ['execute store result storage schem:run block.i int 1 run scoreboard players add schem.i ftemp 1', \
    'function schem:macro/block with storage schem:run block']
$data modify storage schem:run block.cmd set value 'function schem:macro/$(mode) with storage schem:run block'
#air error
data modify storage schem:run air set value "minecraft:air"

#>run
$execute rotated $(r0) 0 run function fxn:fill/carat with storage schem:run

#tellraw command
$scoreboard players set bool ftemp $(text)
execute unless score bool ftemp matches 1 run return fail
#get pos, r0, schem
function fxn:context/pos {path:"storage schem:run pos", include:[x,y,z]}
$data modify storage schem:run pos.r0 set value $(r0)
$data modify storage schem:run pos.schem set value $(schem)
#>tellraw
function schem:tellraw/rotate with storage schem:run pos
