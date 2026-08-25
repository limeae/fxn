#saves [x, y, z, r0, r1, dim, facing] to 'path'
#return -
#with {path, include:[x,y,z,r0,...]}

#>include can have any from [double, x,y,z,r0,r1,dim] | or any from [double, all, !x,!y,!z,!r0,!r1,!dim]
#include 'double' to get decimals

#
#default case
data modify storage fxn:context pos merge value {x:0,y:0,z:0,r0:0,r1:0,dim:0}

#save macros
$data modify storage fxn:context pos.path set value "$(path)"

#save include
$data modify storage fxn:context pos.include set value $(include)
#convert from include to set of bools
function fxn:array/if {path: "storage fxn:context pos.include", value:"x", cmd:"return run data modify storage fxn:context pos.x set value 1"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"y", cmd:"return run data modify storage fxn:context pos.y set value 1"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"z", cmd:"return run data modify storage fxn:context pos.z set value 1"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"r0", cmd:"return run data modify storage fxn:context pos.r0 set value 1"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"r1", cmd:"return run data modify storage fxn:context pos.r1 set value 1"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"dim", cmd:"return run data modify storage fxn:context pos.dim set value 1"}

#check if contains "all"
function fxn:array/if {path: "storage fxn:context pos.include", value:"all", cmd:"return run data modify storage fxn:context pos merge value {x:1,y:1,z:1,r0:1,r1:1,dim:1}"}
#check if contains "!<>"
function fxn:array/if {path: "storage fxn:context pos.include", value:"!x", cmd:"return run data modify storage fxn:context pos.x set value 0"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"!y", cmd:"return run data modify storage fxn:context pos.y set value 0"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"!z", cmd:"return run data modify storage fxn:context pos.z set value 0"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"!r0", cmd:"return run data modify storage fxn:context pos.r0 set value 0"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"!r1", cmd:"return run data modify storage fxn:context pos.r1 set value 0"}
function fxn:array/if {path: "storage fxn:context pos.include", value:"!dim", cmd:"return run data modify storage fxn:context pos.dim set value 0"}

#run as marker
execute unless entity cfac76b4-30ec-45f6-952f-2d9400d4dbec run summon marker ~ ~ ~ {UUID:[-810781004, 820790774, -1792070252, 13949932]}
#pos | pos_int (default)
scoreboard players set if ftemp 0
function fxn:array/if {path: "storage fxn:context pos.include", value:"double", cmd:"return run scoreboard players set if ftemp 1"}
execute if score if ftemp matches 0 as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos_int with storage fxn:context pos
execute if score if ftemp matches 1 as cfac76b4-30ec-45f6-952f-2d9400d4dbec run function fxn:context/macro/pos with storage fxn:context pos
