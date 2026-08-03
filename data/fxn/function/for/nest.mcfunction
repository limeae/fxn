#runs for loops with each variable in the nest
#with {nest[{command, start, end}]}

#>nest: [{command"scoreboard ... x ftemp = i ftemp",start:1,end:2}, {command:"... y ...",start:3,end:4}, {command:"... z ...",start:5,end:6}, {command:"say {x}{y}{z}",start:0,end:0}] outer -> inner
#note: the last nest is simply a command with no looping

#save nest to storage
$data modify storage fxn:for nest.list set value $(nest)

#generate path from first entry to last entry
function fxn:array/cmd {namespace:"storage fxn:for nest.list", command:'function fxn:for/macro/path with storage fxn:array cmd'}

#>loop with the first entry
function fxn:for/macro/nest with storage fxn:for nest.list[0]
