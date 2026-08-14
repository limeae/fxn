#rotate, scale, and move the region (into tool:view)
#with {di, dj, dk, r0, r1, si, sj, sk, offset, args}

#>all blocks go into tool:view

#'di' is left
#'dj' is up
#'dk' is forward
#r01 change rotation
#sijk scale dijk
#offset: "~ ~10 ~" or "^ ^ ^2" (uses original rotation)
#>args: "strict masked" (for clone) whitespace beforehand!!

#load
#>fix this vvv
execute in tool:view run forceload add ~-5 ~-5 ~5 ~5
execute in tool:view run forceload add 0 0 0 0

#save r01 and args to fxn:fill pos
$data modify storage fxn:fill pos.r0 set value $(r0)
$data modify storage fxn:fill pos.r1 set value $(r1)
$data modify storage fxn:fill pos.args set value "$(args)"
$data modify storage fxn:fill pos.offset set value "$(offset)"
#cmd wrapper
$function tool:cmd {dx:$(di), dy:$(dj), dz:$(dk), command:'function fxn:list/free \
    {list: ["function tool:macro/scale {sx:$(si), sy:$(sj), sz:$(sk)}", "function tool:macro/vect with storage fxn:fill pos"]}'}
