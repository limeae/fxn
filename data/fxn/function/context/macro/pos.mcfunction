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
$execute if score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"x"} run say data modify $(path)x set from entity @s Pos[0]', i:0}
$execute if score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"y"} run say data modify $(path)y set from entity @s Pos[1]', i:0}
$execute if score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"z"} run say data modify $(path)z set from entity @s Pos[2]', i:0}
$execute if score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"r0"} run say data modify $(path)r0 set from entity @s Rotation[0]', i:0}
$execute if score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"r1"} run say data modify $(path)r1 set from entity @s Rotation[1]', i:0}

#int: x, y, z,  r0, r1
$execute unless score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"x"} store result $(path)x int 1 run data get entity @s Pos[0]', i:0}
$execute unless score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"y"} store result $(path)y int 1 run data get entity @s Pos[1]', i:0}
$execute unless score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"z"} store result $(path)z int 1 run data get entity @s Pos[2]', i:0}
$execute unless score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"r0"} store result $(path)r0 int 1 run data get entity @s Rotation[0]', i:0}
$execute unless score double ftemp matches 1 run function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"r1"} store result $(path)r1 int 1 run data get entity @s Rotation[1]', i:0}

#>nearest players dimension (fix this if dimension has no players)
$function fxn:array {path:"storage fxn:context include", cmd:'execute if data storage fxn:array {value:"dim"} run data modify $(path)dim set from entity @p Dimension', i:0}
