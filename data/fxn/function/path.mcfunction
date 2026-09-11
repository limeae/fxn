#runs the path as a command | handle | list
#return -
#with {path}


#
$execute unless data $(path) run return fail

#command | handle | list of commands
$execute unless data $(path).cmd unless data $(path).list unless data $(path)[0] run data modify storage fxn:cmd cmd set from $(path)
$execute unless data $(path).cmd unless data $(path).list unless data $(path)[0] run function fxn:cmd with storage fxn:cmd

#path: "storage draft:draft" | "storage draft:draft example.data" (one throws an error)
$function fxn:cmd {cmd:'execute if data $(path).cmd run function fxn:handle/path {path:"$(path)"}'}
$function fxn:cmd {cmd:'execute if data $(path) cmd run function fxn:handle/path {path:"$(path)"}'}

$execute if data $(path)[0] run function fxn:array {path:"$(path)", cmd:'function fxn:prefab/array/path with storage fxn:array', i:0}
