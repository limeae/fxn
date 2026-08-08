#creates a command handle with all given contexts
#while keeping previous data in the namespace
#with {namespace, merge: {command, uuid, pos{}, x, y, z, r0, r1, dim, storage{},tags[]}}

#>namespace: "storage draft:draft example.data"
#>example:
#>function fxn:schedule {merge: {command:"say hi", uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}


#
#>doesnt remove old data

#save merge to storage
$data modify $(namespace) merge value $(merge)

#defaults if not provided
$function fxn:command/create/macro/default {namespace:"$(namespace)"}

#special contexts for "context"
$function fxn:command/create/macro/context {namespace:"$(namespace)"}
