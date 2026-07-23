#saves [x, y, z, r0, r1, dim, facing] to 'namespace'
#with storage fxn:context pos {namespace, x BOOL, y BOOL, z BOOL, r0 BOOL, r1 BOOL, dim BOOL} (not used, use storage)

#>pls dont run this fxn, use context/pos


#rotate properly
rotate @s ~ ~
#pos x,y,z
$execute if data storage fxn:context {pos:{x:1}} run \
    data modify $(namespace).x set from entity @s Pos[0]
$execute if data storage fxn:context {pos:{y:1}} run \
    data modify $(namespace).y set from entity @s Pos[1]
$execute if data storage fxn:context {pos:{z:1}} run \
    data modify $(namespace).z set from entity @s Pos[2]
#rot r0,r1
$execute if data storage fxn:context {pos:{r0:1}} run \
    data modify $(namespace).r0 set from entity @s Rotation[0]
$execute if data storage fxn:context {pos:{r1:1}} run \
    data modify $(namespace).r1 set from entity @s Rotation[1]
#dimension from nearby player, bc Mojang
$execute if data storage fxn:context {pos:{dim:1}} run \
    data modify $(namespace).dim set from entity @p Dimension
kill @s

#get "facing" direction from command_block (really any block with "facing")
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=north] run data modify $(namespace).r0 set value -180
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=east] run data modify $(namespace).r0 set value -90
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=south] run data modify $(namespace).r0 set value 0
$execute if data storage fxn:context {pos:{dim:1}} run \
    execute if block ~ ~ ~ command_block[facing=west] run data modify $(namespace).r0 set value 90

return 1