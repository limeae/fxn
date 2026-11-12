#copy the data of the block ~~~
#return -
#with {rot}

#block
data remove storage strt:temp block
function strt:context/block
data modify storage strt:temp current.block set from storage strt:temp block
#blockstate
data remove storage strt:temp blockstate
data remove storage strt:temp bscct
$function strt:context/blockstate/$(rot)
function strt:context/blockstate/copy
function strt:context/blockstate/concat {bscct:na, prev:na, i:0}
data modify storage strt:temp current.bscct set from storage strt:temp bscct

#check against list
data modify storage strt:temp current.i set value 0
function strt:fill/checklist with storage strt:temp current
