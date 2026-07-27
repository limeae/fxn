#extends the selected region OR selects a new region
#with {x, y, z INTS}

#ran as the player


#>uuid match
#run for each entry in list, find entry with uuid match -> return 0 or 1.., -> save entry's index to -> 'storage tool:select entry.index'
data remove storage tool:select entry.index
execute store result score result ftemp run function fxn:array/cmd {namespace:"storage tool:select list", command:'function tool:entry/index with storage fxn:array cmd'}
#result ftemp = 0 for no match, = 1 for 1 match, = 2.. for multiple entries

#(if match) extend maths, changes {x, y, z, dx, dy, dz} inside list[$(entry)]
$execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{x:$(x), y:$(y), z:$(z)}, command:"function tool:math/extend"}
#(if match) box particles, with data inside list[$(entry)]
execute if score result ftemp matches 1.. run return run function tool:entry/cmd {macros:{command:"function tool:particle/box"}, command:'function tool:entry/data'}



#>no uuid match
#(unless match) new entry with xyz, get uuid as well
$execute unless score result ftemp matches 1.. run data modify storage tool:select list prepend value {uuid:0,x:$(x), y:$(y), z:$(z),dx:0,dy:0,dz:0,qx:0,qy:0,qz:0}
execute unless score result ftemp matches 1.. run function fxn:context/uuid {namespace:"storage tool:select list[0]"}
#(unless match) box particles, with data inside list[0]
execute unless score result ftemp matches 1.. run function tool:entry/data {index:0,command:"function tool:particle/box"}

