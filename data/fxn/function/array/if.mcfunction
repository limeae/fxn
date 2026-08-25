#runs cmd if value in the pathed array
#return -
#with {path, value, cmd}

#path: "storage draft:draft example.array"

$function fxn:array/cmd {path:"$(path)", cmd:\
    'execute if data storage fxn:array {value:$(value)} run $(cmd)'}
