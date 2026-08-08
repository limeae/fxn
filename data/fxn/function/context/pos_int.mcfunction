#saves [x, y, z, r0, r1, dim, facing] to 'namespace'
#with {namespace, include:[x,y,z,r0,...]}

#>include can have any from [x,y,z,r0,r1,dim] | or any from [all, !x,!y,!z,!r0,!r1,!dim]


#
#default case
data modify storage fxn:context pos merge value {x:0,y:0,z:0,r0:0,r1:0,dim:0}

#save namespace to storage
$data modify storage fxn:context pos.namespace set value "$(namespace)"

#save include to storage
$data modify storage fxn:context pos.include set value $(include)
#convert from include to set of bools
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"x", return:"return run data modify storage fxn:context pos.x set value 1"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"y", return:"return run data modify storage fxn:context pos.y set value 1"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"z", return:"return run data modify storage fxn:context pos.z set value 1"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"r0", return:"return run data modify storage fxn:context pos.r0 set value 1"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"r1", return:"return run data modify storage fxn:context pos.r1 set value 1"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"dim", return:"return run data modify storage fxn:context pos.dim set value 1"}

#check if contains "all"
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"all", return:"return run data modify storage fxn:context pos merge value {x:1,y:1,z:1,r0:1,r1:1,dim:1}"}
#check if contains "!<>"
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!x", return:"return run data modify storage fxn:context pos.x set value 0"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!y", return:"return run data modify storage fxn:context pos.y set value 0"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!z", return:"return run data modify storage fxn:context pos.z set value 0"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!r0", return:"return run data modify storage fxn:context pos.r0 set value 0"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!r1", return:"return run data modify storage fxn:context pos.r1 set value 0"}
function fxn:array/if_value {namespace: "storage fxn:context pos.include", value:"!dim", return:"return run data modify storage fxn:context pos.dim set value 0"}

#return run as marker with storage fxn:context/pos {namespace, x BOOL, y BOOL, z BOOL, r0 BOOL, r1 BOOL, dim BOOL}
#loaded
execute summon marker run function fxn:loaded {command:'function fxn:context/macro/pos_int with storage fxn:context pos'}
