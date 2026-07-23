#runs from context/uuid
#with fxn:context uuid {namespace, 00, 01, ..., 07, 10, ..., 17, ..., 37}

#saves hyphenated hexadecimal uuid to $(namespace).uuid
$data modify $(namespace).uuid set value "$(00)$(01)$(02)$(03)$(04)$(05)$(06)$(07)-$(10)$(11)$(12)$(13)-$(14)$(15)$(16)$(17)-$(20)$(21)$(22)$(23)-$(24)$(25)$(26)$(27)$(30)$(31)$(32)$(33)$(34)$(35)$(36)$(37)"
