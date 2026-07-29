#clears all scheduled commands with matching provided ifs
#with storage fxn:array cmd {if, namespace, decrement}

#>provided ifs can be for {gametime, command, x, y, z, r0, r1, dim, uuid, storage, tags[]}\
    tags array is considered 'all of', not 'any of'


#
#>get some data
#gametime
$execute store result score scheduletime ftemp run data get $(namespace)[$(decrement)].gametime
#command
$data modify storage fxn:matches command set from $(namespace)[$(decrement)].command
#loops
$data modify storage fxn:matches uuid set from $(namespace)[$(decrement)].loops
#uuid
$data modify storage fxn:matches uuid set from $(namespace)[$(decrement)].uuid
#dim
$data modify storage fxn:matches dim set from $(namespace)[$(decrement)].dim
#xyz
$data modify storage fxn:matches x set from $(namespace)[$(decrement)].x
$data modify storage fxn:matches y set from $(namespace)[$(decrement)].y
$data modify storage fxn:matches z set from $(namespace)[$(decrement)].z
#r01
$data modify storage fxn:matches r0 set from $(namespace)[$(decrement)].r0
$data modify storage fxn:matches r1 set from $(namespace)[$(decrement)].r1
#tags
data modify storage fxn:matches tags set value []
$execute if data $(namespace)[$(decrement)].tags run data modify storage fxn:matches tags set from $(namespace)[$(decrement)].tags
#storage
$data modify storage fxn:matches storage set from $(namespace)[$(decrement)].storage


#>if
#example: 'if score scheduletime ftemp <= gametime ftemp'
#example: 'run function fxn:array/if_value {namespace:"storage fxn:matches tags", value:"wallabee", return:"return 1"}'
scoreboard players set ifsuccess ftemp 0
$execute store result score ifsuccess ftemp $(if)
execute unless score ifsuccess ftemp matches 1.. run return fail

#return clear entry if there are no more ifs
$execute unless data storage fxn:schedule ifs[1] run return run data remove $(namespace)[$(decrement)]
#get and run the next if
data remove storage fxn:schedule ifs[0]
data modify storage fxn:array cmd.if set from storage fxn:schedule ifs[0]
return run function fxn:schedule/clear/macro/ifs with storage fxn:array cmd
#loops

