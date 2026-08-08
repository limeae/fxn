#toggle the players particle tag for the group
#with {group}

#>group: "mypoint"

#toggle
$execute if entity @s[tag=wp.$(group)] run return run tag @s remove wp.$(group)
$return run tag @s add wp.$(group)
