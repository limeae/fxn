#delete a random entry in an array
#with {namespace, rand INT}

#>namespace: "storage draft:draft example.array"


#i wish this wasn't its own function
$return run data remove $(namespace)[$(rand)]
