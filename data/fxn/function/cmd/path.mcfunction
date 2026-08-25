#runs the path as a command
#return -
#with {path}

#
$execute unless data $(path) run return fail

#handle (merge) | command
$execute unless data $(path).cmd run data modify storage fxn:cmd cmd set from $(path)
$execute unless data $(path).cmd run function fxn:cmd with storage fxn:cmd

$execute if data $(path).cmd run data modify storage fxn:cmd merge set from $(path)
$execute if data $(path).cmd run function fxn:cmd/merge with storage fxn:cmd
