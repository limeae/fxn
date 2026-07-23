#runs tool:select/extend at pos
#


#get pos
function fxn:context/pos_int {namespace:"storage tool:select entry", include:[x, y, z]}
#run function
function tool:select/extend with storage tool:select entry
