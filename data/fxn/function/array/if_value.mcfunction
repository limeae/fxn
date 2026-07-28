#checks if 'value' is inside of 'namespace' array, 'return's
#with {namespace, value, return}

#>namespace: "storage draft:draft example.array"
#value: "random_array_entry" | NOTE: please no spaces or non-singlestring characters
#return: "return 1" OR "return run function draft:say_number with storage fxn:array if_value " {decrement}\
    OR "say I'm not breaking the loop!" (doesn't break the loop)
#>return 1 returns if the value was found

#its just a wrapper for array/cmd
$return run function fxn:array/cmd {namespace:"$(namespace)", command:'execute if data storage fxn:matches {value:$(value)} run $(return)'}
