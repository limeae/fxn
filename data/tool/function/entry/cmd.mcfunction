#runs another function with {index}
#with {macros:{x, y, z}, command}
#>allows for manual write and read


#save macros to storage
$data modify storage tool:select entry merge value $(macros)

#where tool:select entry.index is the index

#>run function
$return run $(command) with storage tool:select entry
