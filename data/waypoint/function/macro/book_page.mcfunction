#gets size of page in storage
#with {page}

say macro/book_page
#
$return run function fxn:array/sizeof {path:'storage waypoint:matches page[$(page)]'}
