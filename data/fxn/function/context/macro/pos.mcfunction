#saves [x, y, z, r0, r1, dim, facing] to 'path'
#return -
#with storage fxn:context pos {path, x BOOL, y BOOL, z BOOL, r0 BOOL, r1 BOOL, dim BOOL} (not used, use storage)

#>pls dont run this fxn, use context/pos


#rotate properly
tp @s ~ ~ ~ ~ ~
#pos x,y,z
$execute if data storage fxn:context {pos:{x:1}} run \
    data modify $(path).x set from entity @s Pos[0]
$execute if data storage fxn:context {pos:{y:1}} run \
    data modify $(path).y set from entity @s Pos[1]
$execute if data storage fxn:context {pos:{z:1}} run \
    data modify $(path).z set from entity @s Pos[2]
#rot r0,r1
$execute if data storage fxn:context {pos:{r0:1}} run \
    data modify $(path).r0 set from entity @s Rotation[0]
$execute if data storage fxn:context {pos:{r1:1}} run \
    data modify $(path).r1 set from entity @s Rotation[1]
#dimension from nearby player, bc Mojang
$execute if data storage fxn:context {pos:{dim:1}} run \
    data modify $(path).dim set from entity @p Dimension


#get "facing" direction from command_block (really any block with "facing")
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=north] run data modify $(path).r0 set value -180
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=east] run data modify $(path).r0 set value -90
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=south] run data modify $(path).r0 set value 0
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=west] run data modify $(path).r0 set value 90
