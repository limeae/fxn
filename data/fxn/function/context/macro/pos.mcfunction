#save x, y, z, r0, r1, and dim (int or double) to the path.xyzr0...
#return -
#with {path}
#context [x, y, z, r0, r1, dim] if included

#>use context/pos

#tp our marker
tp @s ~ ~ ~ ~ ~

#path: "storage draft:draft " | "storage draft:draft example.data." (with whitespace or period)
#check if $(path)x is valid, otherwise throw error and end early
$data get $(path)x


#double: x, y, z,  r0, r1
$execute if score double fxn matches 1 if data storage fxn:context {include:["x"]} run data modify $(path)x set from entity @s Pos[0]
$execute if score double fxn matches 1 if data storage fxn:context {include:["y"]} run data modify $(path)y set from entity @s Pos[1]
$execute if score double fxn matches 1 if data storage fxn:context {include:["z"]} run data modify $(path)z set from entity @s Pos[2]
$execute if score double fxn matches 1 if data storage fxn:context {include:["r0"]} run data modify $(path)r0 set from entity @s Rotation[0]
$execute if score double fxn matches 1 if data storage fxn:context {include:["r1"]} run data modify $(path)r1 set from entity @s Rotation[1]

#int: x, y, z,  r0, r1
$execute unless score double fxn matches 1 if data storage fxn:context {include:["x"]} store result $(path)x int 1 run data get entity @s Pos[0]
$execute unless score double fxn matches 1 if data storage fxn:context {include:["y"]} store result $(path)y int 1 run data get entity @s Pos[1]
$execute unless score double fxn matches 1 if data storage fxn:context {include:["z"]} store result $(path)z int 1 run data get entity @s Pos[2]
$execute unless score double fxn matches 1 if data storage fxn:context {include:["r0"]} store result $(path)r0 int 1 run data get entity @s Rotation[0]
$execute unless score double fxn matches 1 if data storage fxn:context {include:["r1"]} store result $(path)r1 int 1 run data get entity @s Rotation[1]


#>nearest players dimension (fix this if dimension has no players)
$execute if data storage fxn:context {include:["dim"]} run data modify $(path)dim set from entity @p Dimension
