#runs tool:select/move at pos
#


#get pos
function fxn:context/pos_int {namespace:"storage tool:select entry", include:[x, y, z]}
#run function
function tool:select/move with storage tool:select entry
