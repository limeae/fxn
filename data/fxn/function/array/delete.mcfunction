#run a command if value is found in array
#return -
#with {path, value}
#context -

$function fxn:array {path:"$(path)", cmd:'execute if data storage fxn:array {value:$(value)} run \
    function fxn:prefab/array/delete with storage fxn:array', i:0}
