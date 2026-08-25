#creates a command handle with all given contexts
#return -
#with {path, def, mode, merge{}}

#>merge: {cmd:"say hi", uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}
#>mode: set | append | prepend
#>def: new (default) | empty | reuse

#>defs
#new (default)
$data modify storage fxn:matches def set value '$(def)'
execute unless data storage fxn:matches {def:'reuse'} run function fxn:cmd/create/default {path:"storage fxn:cmd create"}
#empty
execute if data storage fxn:matches {def:'empty'} run data remove storage fxn:cmd create
#reuse
#(leave the old storage as it is)

#merge merge
$data modify storage fxn:cmd create merge value $(merge)

#get special contexts
function fxn:cmd/create/context {path:"storage fxn:cmd create"}

#>mode
$data modify $(path) $(mode) from storage fxn:cmd create
