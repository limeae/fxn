#save x, y, z, r0, r1, and dim (int or double) to the path.xyzr0...
#return -
#with {path, include[double, x, y, z, r0, r1, dim, | all]}
#context [x, y, z, r0, r1, dim] if included


#save include list
$data modify storage fxn:context include set value $(include)

#data type: int (default) | double (add to include list)
scoreboard players set double ftemp 0
function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"double"} run scoreboard players set double ftemp 1', i:0}

#all
function fxn:array {path:"storage fxn:context include", cmd:'\
    execute if data storage fxn:array {value:"all"} run return run data modify storage fxn:context include set value [x, y, z, r0, r1, dim]', i:0}


#get our marker
execute unless entity cfac76b4-30ec-45f6-952f-2d9400d4dbec run summon marker ~ ~ ~ {UUID:[-810781004, 820790774, -1792070252, 13949932]}

#run the rest as our marker
#path: "storage draft:draft " | "storage draft:draft example.data." (with whitespace or period)
$execute as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos {path:'$(path).'}
$execute as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos {path:'$(path) '}
