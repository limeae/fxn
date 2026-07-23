#merge data into selection
#with {index, merge{}}


#
$data modify storage tool:select list[$(index)] merge value $(merge)
