#save x, y, z, r0, r1, and dim (int or double) to the path.xyzr0...
#return -
#with {path, include[double; x, y, z, r0, r1, dim, | all]}


#save include list
$data modify storage fxn:context include set value $(include)

#data type: int (default) | double (add to include list)
scoreboard players set double fxn 0
execute if data storage fxn:context {include:["double"]} run scoreboard players set double fxn 1

#all
execute if data storage fxn:context {include:["all"]} run data modify storage fxn:context include set value [x, y, z, r0, r1, dim]


#get our marker
execute unless entity cfac76b4-30ec-45f6-952f-2d9400d4dbec run summon marker ~ ~ ~ {UUID:[-810781004, 820790774, -1792070252, 13949932]}

#run the rest as our marker
#path: "storage draft:draft " | "storage draft:draft example.data." (with whitespace or period)
$execute as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos {path:'$(path).'}
$execute as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos {path:'$(path) '}
