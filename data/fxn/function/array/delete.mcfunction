#deletes value if value in the pathed array
#return -
#with {path, value}

#path: "storage draft:draft example.array"

$function fxn:array/if {path:"$(path)", value:$(value), cmd:\
    'scoreboard players set code ftemp -122'}
