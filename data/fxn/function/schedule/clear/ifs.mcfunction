#clears all scheduled commands with matching provided ifs
#with {ifs[]}

#provided ifs can be for {gametime, command, x, y, z, r0, r1, dim, uuid, storage, tags[]}\
    tags array is considered 'all of', not 'any of'


#>ifs: ["if score temp ftemp <= gametime ftemp", "if data storage fxn:schedule {gametime:10}",...]

#
#save ifs to temp storage
$data modify storage fxn:schedule ifs_temp set value $(ifs)


#empty list error
execute unless data storage fxn:schedule ifs_temp[0] run return run say fail
#array/cmd on list, with ifs
return run function fxn:array/cmd {namespace:"storage fxn:schedule list", command:'\
    function fxn:list {list: ["data modify storage fxn:schedule ifs set from storage fxn:schedule ifs_temp", \
        "data modify storage fxn:array cmd.if set from storage fxn:schedule ifs[0]", \
        "function fxn:schedule/clear/macro/ifs with storage fxn:array cmd"]}\
    '}
#^^^ reset list of ifs, get if[0], start array/cmd loop

function fxn:list {list: ["data modify storage fxn:schedule ifs set from storage fxn:schedule ifs_temp","data modify storage fxn:array cmd.if set from storage fxn:schedule ifs[0]","function fxn:schedule/clear/macro/ifs with storage fxn:array cmd"]}
