#loops in a direction with a command
#with {dist FLOAT, max COMMAND, command}

#>command must pass parsing to run (write it correctly)
#>command should have a conditional execute: 'if block' or 'if entity' or ...


#>run raycast
scoreboard players reset failsafe ftemp
$function fxn:utils/raycast {dist:$(dist), max:$(max), command:'$(command)'}
