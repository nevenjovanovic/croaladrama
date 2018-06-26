(: find performances with note on Japan as region of interest :)
for $p in //*:bibl[@type="drama" and *:note[@corresp="regija" and text()="Japan"]]
return $p