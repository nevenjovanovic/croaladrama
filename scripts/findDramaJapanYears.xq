(: find performances on Japan, sort by years, return name and place :)
let $jap := (
for $p in //*:bibl[@type="drama" and *:note[@corresp="regija" and text()="Japan"]]
return $p )
for $j in $jap
let $placeref := $j//*:placeName/@ref
let $placename := $j//*:placeName/string()
let $title := data($j/*:title[text()])
let $year := $j/*:date[1]/@when/string()
let $test := $j/*:note[@type="testimonium"]/*:quote
order by $year
return element tr { 
element td { $year } , 
element td { for $t in $title return normalize-space($t) } , 
element td { $placename },
element td { for $t in $test return normalize-space($t) } }