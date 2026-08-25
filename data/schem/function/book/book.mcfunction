#edit the pages of the summoned book
#return -
#with storage schem:save {schem}

#edit
data modify storage schem:save book.pages set value [[]]
data modify storage schem:save book.pages[0] append value \
    {text:"schematic\n"}
#move (rotate 0)
$data modify storage schem:save book.pages[0] append value \
    {text:"move",color:blue,click_event:{action:"run_command",command:'function schem:rotate {r0:0, text:1, mode:particle, schem:$(schem)}'}}
$data modify storage schem:save book.pages[0] append value \
    {text:" copycmd\n",color:blue,click_event:{action:"copy_to_clipboard",value:'execute as @p run function schem:rotate {r0:0, text:1, mode:particle, schem:$(schem)}'}}
#rotate 90, 180, 270
data modify storage schem:save book.pages[0] append value {text:"rotate: ",color:light_purple}
$data modify storage schem:save book.pages[0] append value \
    {text:"90* ",color:light_purple,click_event:{action:"run_command",command:'function schem:rotate {r0:90, text:1, mode:particle, schem:$(schem)}'}}
$data modify storage schem:save book.pages[0] append value \
    {text:"180* ",color:light_purple,click_event:{action:"run_command",command:'function schem:rotate {r0:-180, text:1, mode:particle, schem:$(schem)}'}}
$data modify storage schem:save book.pages[0] append value \
    {text:"270* ",color:light_purple,click_event:{action:"run_command",command:'function schem:rotate {r0:-90, text:1, mode:particle, schem:$(schem)}'}}
#summon
summon item ~ ~ ~ {Item:{id:written_book,components:{written_book_content:{title:"schematic",pages:[['fu']],author:"schem"}}}}
data modify entity @n[type=item] Item.components."minecraft:written_book_content".pages set from storage schem:save book.pages
