#run a command for every block in the region
#return -
#with {x, y, z, cmd}


#>does not run at the block, write the ~x ~y ~z function yourself, or use fxn:fill


data remove storage fxn:pos key
#order: z -> x -> y
#fill:{for:{z:'function fxn:for/cmd {i:0, end:$(z), ...}', x...}, list:{z:["data modify ... z ...",...], x...}}

#z
#$data modify storage fxn:pos fill.for.z set value 'function fxn:for/cmd {i:0, end:$(z), cmd:"function fxn:list/path {path:\\"storage fxn:pos fill.list.z\\"}"}'
data modify storage fxn:pos fill.list.z set value ['data modify storage fxn:pos z set from storage fxn:for i', 'function fxn:cmd/path {path:"storage fxn:pos fill.for.x"}']
#x
$data modify storage fxn:pos fill.for.x set value 'function fxn:for/cmd {i:0, end:$(x), cmd:"function fxn:list/path {path:\\"storage fxn:pos fill.list.x\\"}"}'
data modify storage fxn:pos fill.list.x set value ['data modify storage fxn:pos x set from storage fxn:for i', 'function fxn:cmd/path {path:"storage fxn:pos fill.for.y"}']
#>y
$data modify storage fxn:pos fill.for.y set value 'function fxn:for/cmd {i:0, end:$(y), cmd:"function fxn:list/path {path:\\"storage fxn:pos fill.list.y\\"}"}'
$data modify storage fxn:pos fill.list.y set value ['data modify storage fxn:pos y set from storage fxn:for i', '$(cmd)']
#^use 'with storage fxn:pos' {x, y, z} for pos data

#>run
$function fxn:for/cmd {i:0, end:$(z), cmd:"function fxn:list/path {path:\"storage fxn:pos fill.list.z\"}"}
