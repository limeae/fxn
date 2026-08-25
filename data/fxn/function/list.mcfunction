#run a list of commands
#return -
#with {list:['', ...}]}


#save list
$execute store result storage fxn:save key int 1 run \
    function fxn:save {save:$(list)}

#run with key
function fxn:list/key with storage fxn:save
