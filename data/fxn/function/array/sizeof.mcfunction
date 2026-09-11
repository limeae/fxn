#returns the size of the pathed array
#>return sizeof
#with {path}
#context -

#path: "storage draft:draft example.array"

$execute store result score sizeof ftemp run execute if data $(path)[]
return run scoreboard players remove sizeof ftemp 1
