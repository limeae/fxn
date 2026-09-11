#runs handle with missing data
#return -
#with {path}


#merge with defaults
function fxn:handle/create/default {path:"storage fxn:cmd temp"}
$data modify storage fxn:cmd temp merge from $(path)

#save command path
#path: "storage draft:draft" | "storage draft:draft example.data"
$execute store result score success ftemp run function fxn:cmd {cmd:"return run execute if data $(path) cmd"}
$execute unless score success ftemp matches 1 run data modify storage fxn:cmd temp.path set value "$(path).cmd"
$execute if score success ftemp matches 1 run data modify storage fxn:cmd temp.path set value "$(path) cmd"

#>run handle
function fxn:handle/run with storage fxn:cmd temp
