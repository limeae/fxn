#appends and runs a list of functions without saving context
#with {list:['command', 'command',...]}

#>example:
#>function fxn:list {list: ['say 1', 'say 2', 'function fxn:list {list: ["say 3", "say 4"]}']}

#>note: fxn:list/free does not save the context when running nested loops
#>this makes it much more efficient, but may cause errors with complicated nests

#
#if something is already in list, do nothing (see fxn:list)

#save list to storage
#>PREPEND!!
$data modify storage fxn:list temp_list set value $(list)
function fxn:array/prepend {from:"storage fxn:list temp_list", to:"storage fxn:list list"}

#
execute unless score in_list ftemp matches 1.. run scoreboard players set success ftemp 0
function fxn:list/loop
#loops
