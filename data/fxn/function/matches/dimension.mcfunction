#check if 'dimension' is the current dimension
#with {dim, return}


#get current dim
function fxn:context/pos {namespace:"storage fxn:matches pos", include:[dim]}
#>check if matches
$execute if data storage fxn:matches {pos:{dim:"$(dim)"}} run $(return)
return 0
