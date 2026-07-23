#check if 'uuid' is the current uuid
#with {uuid, return}


#get current uuid
function fxn:context/uuid {namespace:"storage fxn:matches matches"}
#>check if matches
$execute if data storage fxn:matches {matches:{uuid:"$(uuid)"}} run $(return)
return 0
