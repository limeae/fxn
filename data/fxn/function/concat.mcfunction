#concatenates 2 values with quotes
#with {namespace, 0, 1}


#
$return run data modify $(namespace) set value "$(0)$(1)"
