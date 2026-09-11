#merges specified macros into the path
#return -
#with {path, merge, fxn}
#context [entity*, block*] *if path is entity | block

#>cmd must be a function without specifying macros
#/!\ the provided merge will overwrite values in the path

#path: "storage draft:draft" | "storage draft:draft example.data"
#one of these will throw an error, so use fxn:cmd
$function fxn:cmd {cmd:'data merge $(path) $(merge)'}
$function fxn:cmd {cmd:'data modify $(path) merge $(merge)'}
#run function with $(path)
$$(fxn) with $(path)
