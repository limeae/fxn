#clone moves selection region to q-region
#

#ran as the player


#>uuid match
#run for each entry in list, find entry with uuid match -> return 0 or 1.., -> save entry's index to -> 'storage tool:select entry.index'
execute store result score result ftemp run function fxn:array/cmd {namespace:"storage tool:select list", command:'function tool:entry/index with storage fxn:array cmd'}
#result ftemp = 0 for no match, = 1 for 1 match, = 2.. for multiple entries

#(if match) 2 boxes particles, with data inside list[$(entry)]
execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{command:"function tool:particle/box"}, command:'function tool:entry/data'}
execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{command:"function tool:particle/qbox"}, command:'function tool:entry/data'}
#(if match) undo clone move
execute if score result ftemp matches 1.. run function tool:entry/cmd {macros:{command:"function tool:op/macro/undo_move"}, command:"function tool:entry/data"}


#>no uuid match
#do nothing
