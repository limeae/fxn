#copies and merges specified macros with path
#return -
#with {path, merge, fxn}
#context [entity*, block*] *if path is entity | block

#path: "storage draft:draft" | "storage draft:draft example.data"
#>cmd must be a function without specifying macros
#the provided merge gets priority over values in the path
#/!\ paths with a lot of data (especially "storage fxn:cmd") will copy all the data

#set "storage fxn:cmd temp" to be 'data in $(path)' and $(merge)
$data modify storage fxn:cmd temp set from $(path)
$data modify storage fxn:cmd temp merge value $(merge)
#run function with "storage fxn:cmd temp"
$$(fxn) with storage fxn:cmd temp
