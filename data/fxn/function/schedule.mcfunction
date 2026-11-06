#append a scheduled command with all given contexts
#return -
#with {merge: {cmd, timedelta, loops, uuid, include[], x, y, z, r0, r1, dim, tags[]}}

#example:
#function fxn:schedule {merge: {cmd:"say hi", timedelta:20, loops:2, uuid:get, include:[all, !dim], dim:"minecraft:the_end", tags:["my_message"]}}



#merge into default
data modify storage fxn:schedule merge set value {cmd:'0', timedelta:0, gametime:0, loops:0, uuid:0, x:'~', y:'~', z:'~', r0:'~', r1:'~', dim:"overworld", tags:[]}
$data modify storage fxn:schedule merge merge value $(merge)

#> CONTEXTS
#path REF
data modify storage fxn:schedule merge.path set value "storage fxn:schedule merge" 

#pos | include: [x,y,z,r0,r1,dim]
execute unless data storage fxn:schedule merge.include run data modify storage fxn:schedule merge.include set from storage fxn:schedule merge.pos
execute if data storage fxn:schedule merge.include run function fxn:context/pos with storage fxn:schedule merge
data remove storage fxn:schedule merge.pos
data remove storage fxn:schedule merge.include

#uuid "get"
execute if data storage fxn:schedule merge{uuid:"get"} run function fxn:context/uuid {path:"storage fxn:schedule merge.uuid"}
execute if data storage fxn:schedule merge{uuid:"context"} run function fxn:context/uuid {path:"storage fxn:schedule merge.uuid"}

#>additional contexts for schedule
#timedelta to gametime
execute store result score scheduletime fxn run data get storage fxn:schedule merge.timedelta
#gametime in function fxn:tick
execute store result storage fxn:schedule merge.gametime int 1 run scoreboard players operation scheduletime fxn += gametime fxn


#>append
data modify storage fxn:schedule list append from storage fxn:schedule merge
