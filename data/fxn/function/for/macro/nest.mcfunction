#runs the for loop from the provided entry
#with storage fxn:for nest.list[0] {command, start, end, path}

#>nest: [{path:1,command"execute store ... x ... i ftemp",start:5,end:6}, {path:2,command:"... y ...",start:5,end:6}, {path:3,command:"...",start:5,end:6}] outer -> inner
#path:3 is not used


#>current for loop
$function fxn:for/cmd {start:$(start), end:$(end), command:'function fxn:list {list: ["$(command)", \
    "execute if data storage fxn:for nest.list[$(path)] run function fxn:for/macro/nest with storage fxn:for nest.list[$(path)]"]}'}
#run the command in a list, then run the pathed nest after ^^^
