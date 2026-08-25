#appends the from array to the to array
#return -
#with {from, to}

#from, to: "storage draft:draft example.array"

$function fxn:array/cmd {path:"$(from)", cmd:'data modify $(to) append from storage fxn:array value', i:0}
