#checks if 'value' is inside of 'namespace' array, deletes value
#with {namespace, value}

#>namespace: "storage draft:draft example.array"
#value: "random_array_entry" | NOTE: please no spaces or non-singlestring characters

#its just a wrapper for array/cmd
$return run function fxn:array/cmd {namespace:"$(namespace)", command:'execute if data storage fxn:matches {value:$(value)} run function fxn:array/delete/macro with storage fxn:array cmd'}
