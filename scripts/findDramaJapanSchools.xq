(: find schools where performances on Japan have taken place :)
let $jap := (
for $p in //*:bibl[@type="drama" and *:note[@corresp="regija" and text()="Japan"]]
return $p )
for $j in $jap
let $placeref := $j//*:placeName/@ref
let $placename := $j//*:placeName/string()
group by $placeref
order by count($j) descending
return ( distinct-values($placename) , count($j) )