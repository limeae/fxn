#returns the size of the pathed array
#>return sizeof
#with {path}

#path: "storage draft:draft example.array"
#>array with 1 entry has size 0 (array[0])

scoreboard players set sizeof ftemp -1
$function fxn:array/cmd {path:"$(path)", cmd:'scoreboard players add sizeof ftemp 1', i:0}
return run scoreboard players get sizeof ftemp
