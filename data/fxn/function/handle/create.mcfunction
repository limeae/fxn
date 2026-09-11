#creates a command handle with all given contexts
#return -
#with {path, def, mode, merge{}}

#>merge: {cmd:"say hi", uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}
#>mode: set | append | prepend | insert | merge
#>def: new | empty (default) | reuse

#>defs
$data modify storage fxn:cmd def set value '$(def)'
#empty (default)
execute unless data storage fxn:cmd {def:'reuse'} run data remove storage fxn:cmd create
#new
execute if data storage fxn:cmd {def:'new'} run function fxn:handle/create/default {path:"storage fxn:cmd create"}
#reuse
#(leave the old storage as it is)

#merge merge
$data modify storage fxn:cmd create merge value $(merge)

#get special contexts
function fxn:handle/create/context {path:"storage fxn:cmd create"}

#>move to path: set | merge | append | prepend | insert
$data modify $(path) $(mode) from storage fxn:cmd create
