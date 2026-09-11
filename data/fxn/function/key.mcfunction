#save a command to a key and run it
#return -
#with {cmd}
#context -

#>key is used when the command cannot be guaranteed a spot in storage
#it creates a temporary spot in storage (on the save list) where it can run
#saving your commands to their own spots in storage, and running fxn:path, is always better

#ex: function fxn:key {cmd:'say counting up!'}
#similar to: /say counting up!
#>cmd can be command | handle | list
#ex: function fxn:key {cmd:['say one', 'say two', {uuid:"@n[type=cow]", cmd:'say moo'}]}

#fxn runs cmd
data modify storage fxn:cmd fxn set value "function fxn:cmd"

#save the command
#string xor no string
$execute store result score success ftemp run function fxn:cmd {cmd:'return run data modify storage fxn:save list append value $(cmd)'}
$execute unless score success ftemp matches 1 run data modify storage fxn:save list append value '$(cmd)'
#savelist is where the new command is
execute store result storage fxn:cmd key int 1 run scoreboard players add savelist ftemp 1

#run the rest with the key
function fxn:key/run with storage fxn:cmd
