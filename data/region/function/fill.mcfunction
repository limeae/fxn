#run a command at every block in a region
#return -
#with {x, y, z, cmd}
#context xyz dim

#x, y, and z are deltas (size)

#region:fill -> fxn:for -> fxn:path -> fxn:array -> fxn:prefab/array/path -> fxn:path -> fxn:cmd ->
#fxn:for -> fxn:path -> fxn:array -> fxn:prefab/array/path -> fxn:path -> fxn:cmd ->
#fxn:for -> fxn:path -> fxn:array -> fxn:prefab/array/path -> fxn:path -> fxn:cmd -> region:pos/delta

#save cmd
$data modify storage region:cmd cmd set value '$(cmd)'
#save 3 for loops
$data modify storage region:cmd run.x set value ['data modify storage region:cmd x set from storage fxn:for i', \
    'function fxn:for {i:0, end:$(y), cmd:\'function fxn:path {path:"storage region:cmd run.y"}\'}']
$data modify storage region:cmd run.y set value ['data modify storage region:cmd y set from storage fxn:for i', \
    'function fxn:for {i:0, end:$(z), cmd:\'function fxn:path {path:"storage region:cmd run.z"}\'}']
data modify storage region:cmd run.z set value ['data modify storage region:cmd z set from storage fxn:for i', \
    'function region:pos/delta with storage region:cmd']
#last one runs region:pos/delta

#run the for loops
$function fxn:for {i:0, end:$(x), cmd:'function fxn:path {path:"storage region:cmd run.x"}'}
