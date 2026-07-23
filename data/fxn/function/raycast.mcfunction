#loops in a direction with a command
#with {dist FLOAT, max COMMAND, command}

#>command must pass parsing to run (write it correctly)
#>command should have a conditional ex: 'if block' or 'if entity'

#>please reset failsafe ftemp before calling this function!

#
#max
scoreboard players add failsafe ftemp 1
$execute if score failsafe ftemp matches $(max).. run return run scoreboard players reset failsafe ftemp

#>command
$$(command)
#loop
$execute positioned ^ ^ ^$(dist) run return run function fxn:raycast {dist:$(dist),max:$(max),command:'$(command)'}
