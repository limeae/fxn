#concatenate the uuid into string
#return -
#with storage fxn:context uuid {00, 01, ... 07, ... 37}

#form ........-....-....-....-............

$data modify storage fxn:context uuid.concat set value "\
    $(07)$(06)$(05)$(04)$(03)$(02)$(01)$(00)-$(17)$(16)$(15)$(14)-$(13)$(12)$(11)$(10)-\
    $(27)$(26)$(25)$(24)-$(23)$(22)$(21)$(20)$(37)$(36)$(35)$(34)$(33)$(32)$(31)$(30)"
