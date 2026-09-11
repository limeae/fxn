#run a function with a key
#return -
#with storage fxn:cmd {key, fxn}
#context -

#>use fxn:key/fxn instead

#convert key to path command
$data modify storage fxn:cmd temp.cmd set value  'function fxn:path {path:"storage fxn:save list[$(key)]"}'

#>run function with merge and path command
$$(fxn) with storage fxn:cmd temp

#delete key after (should never mess up other keys, as other keys can only be created within the fxn, and are deleted within the fxn at this same point)
$data remove storage fxn:save list[$(key)]
scoreboard players remove savelist ftemp 1
#for now, tell us if messes up
$execute if data storage fxn:save list[$(key)] run say [fxn] key $(key) moved!
