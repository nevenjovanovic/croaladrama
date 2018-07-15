let $ps :=
for $p in //*:bibl[@type="drama"]
order by $p/*:date[1]/@when
return $p
return $ps[last() - 1]