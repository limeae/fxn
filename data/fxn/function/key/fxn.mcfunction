#save a command to a key and run a function with it
#return -
#with {cmd, fxn, merge}
#context -

#>key is used when the command cannot be guaranteed a spot in storage
#it creates a temporary spot in storage (on the save list) where it can run
#saving your commands to their own spots in storage, and running fxn:path, is always better

#ex: function fxn:key/merge {cmd:'say counting up!', fxn:'function fxn:for', merge:{i:0, end:5}}
#similar to: function fxn:for {i:0, end:5, cmd:'say counting up!'}
#>cmd can be command | handle | list (use fxn:cmd to directly run them)
#ex: function fxn:key {cmd:['say one', 'say two'], fxn:'function fxn:cmd', merge:{}}

#save merge and fxn
$data modify storage fxn:cmd temp set value $(merge)
$data modify storage fxn:cmd fxn set value "$(fxn)"

#save the command
#string xor no string
$execute store result score success ftemp run function fxn:cmd {cmd:'return run data modify storage fxn:save list append value $(cmd)'}
$execute unless score success ftemp matches 1 run data modify storage fxn:save list append value '$(cmd)'
#savelist is where the new command is
execute store result storage fxn:cmd key int 1 run scoreboard players add savelist ftemp 1

#run the rest with the key
function fxn:key/run with storage fxn:cmd
