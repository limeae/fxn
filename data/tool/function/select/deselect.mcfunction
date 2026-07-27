#remove players selection
#

#ran as the player


#>uuid match
#run for each entry in list, find entry with uuid match -> return 0 or 1.., -> save entry's index to -> 'storage tool:select entry.index'
data remove storage tool:select entry.index
execute store result score result ftemp run function fxn:array/cmd {namespace:"storage tool:select list", command:'return run function tool:entry/index with storage fxn:array cmd'}
#result ftemp = 0 for no match, = 1 for 1 match, = 2.. for multiple entries

#(if match) delete
execute if score result ftemp matches 1.. run return run function tool:entry/cmd {macros:{}, command:'function tool:math/remove'}



#>no uuid match
#do nothing