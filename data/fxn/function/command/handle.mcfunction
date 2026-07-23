#runs a command with all contexts, requires all or defaults from merge
#with {command, uuid, x, y, z, r0, r1, dim, storage{}}


#save uuid and command to storage
$data modify storage fxn:command merge.uuid set value '$(uuid)'
$data modify storage fxn:command merge.storage set value $(storage)

#>no storage
#run command
$execute if data storage fxn:command {merge:{storage:0}} unless data storage fxn:command {merge:{uuid:'0'}} \
    run return run function fxn:command/context/all {command:'$(command)', uuid:'$(uuid)', x:$(x), y:$(y), z:$(z), r0:$(r0), r1:$(r1), dim:'$(dim)'}
#run command no_uuid
$execute if data storage fxn:command {merge:{storage:0}} if data storage fxn:command {merge:{uuid:'0'}} \
    run return run function fxn:command/context/no_uuid {command:'$(command)', x:$(x), y:$(y), z:$(z), r0:$(r0), r1:$(r1), dim:'$(dim)'}

#>storage
#run command (functions only)
$execute unless data storage fxn:command {merge:{storage:0}} unless data storage fxn:command {merge:{uuid:'0'}} \
    run return run function fxn:command/storage/all {command:'$(command)', uuid:'$(uuid)', x:$(x), y:$(y), z:$(z), r0:$(r0), r1:$(r1), dim:'$(dim)', storage:$(storage)}
#run command no_uuid (functions only)
$execute unless data storage fxn:command {merge:{storage:0}} if data storage fxn:command {merge:{uuid:'0'}} \
    run return run function fxn:command/storage/no_uuid {command:'$(command)', x:$(x), y:$(y), z:$(z), r0:$(r0), r1:$(r1), dim:'$(dim)', storage:$(storage)}

