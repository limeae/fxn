#run a command if value is found in array
#return -
#with {path, value, cmd}
#context -

$function fxn:array {path:"$(path)", cmd:'execute if data storage fxn:array {value:$(value)} run $(cmd)', i:0}
