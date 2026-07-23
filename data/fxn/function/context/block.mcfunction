#saves block id to $(namespace).block
#with {namespace}

#>where {namespace:  "storage draft:draft example.data"}


#summon item holder and run with it
$execute summon item_display run function schedule:context/macro/block {namespace:"$(namespace)"}
