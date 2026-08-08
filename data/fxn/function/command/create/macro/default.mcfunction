#creates defaults for a command handle
#with {namespace}

#>namespace: "storage draft:draft example.data"


#
#>defaults if not provided
#command
$execute unless data $(namespace).command run data modify $(namespace).command set value "say but nothing was scheduled..."
#pos
$execute unless data $(namespace).x run data modify $(namespace).x set value 0
$execute unless data $(namespace).y run data modify $(namespace).y set value 0
$execute unless data $(namespace).z run data modify $(namespace).z set value 0
#rot
$execute unless data $(namespace).r0 run data modify $(namespace).r0 set value 0
$execute unless data $(namespace).r1 run data modify $(namespace).r1 set value 0
#dim
$execute unless data $(namespace).dim run data modify $(namespace).dim set value "minecraft:overworld"
#uuid
$execute unless data $(namespace).uuid run data modify $(namespace).uuid set value 0
#storage
$execute unless data $(namespace).storage run data modify $(namespace).storage set value 0

