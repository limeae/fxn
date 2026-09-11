#append an array to another array
#return -
#with {from, to}
#context -

$function fxn:array {path:"$(from)", cmd:'data modify $(to) append from storage fxn:array value', i:0}
