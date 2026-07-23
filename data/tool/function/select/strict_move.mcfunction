#adds onto 'q' movement vector, displays 2nd box
#with {x, y, z INTS}

#ran as the player


#>uuid match
#run for each entry in list, find entry with uuid match -> return 0 or 1.., -> save entry's index to -> 'storage tool:select entry.index'
execute store result score result ftemp run function fxn:array/cmd {namespace:"storage tool:select list", command:'function tool:entry/index with storage fxn:array cmd'}
#result ftemp = 0 for no match, = 1 for 1 match, = 2.. for multiple entries

#(if match) move maths, changes {qx, qy, qz} inside list[$(entry)]
$execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{qx:$(x), qy:$(y), qz:$(z)}, command:"function tool:math/strict_move"}
#(if match) 2 boxes particles, with data inside list[$(entry)]
execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{command:"function tool:particle/box"}, command:'function tool:entry/data'}
execute if score result ftemp matches 1.. run return run function tool:entry/cmd {macros:{command:"function tool:particle/qbox"}, command:'function tool:entry/data'}



#>no uuid match
#do nothing
