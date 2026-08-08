#appends a command handle with all given contexts
#while keeping previous data in the namespace
#with {namespace, merge: {command, uuid, pos{}, x, y, z, r0, r1, dim, storage{},tags[]}}

#>namespace: "storage draft:draft example.data"
#>example:
#>function fxn:schedule {merge: {command:"say hi", uuid:context, pos:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}


#create in a temp storage
$function fxn:command/create/reuse {namespace:"storage fxn:command merge", merge:$(merge)}

#append
$data modify $(namespace) append from storage fxn:command merge
