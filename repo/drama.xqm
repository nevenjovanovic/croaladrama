module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama";

import module namespace dramahelp = "http://www.ffzg.unizg.hr/klafil/dramahelp" at "dramahelp.xqm";

declare namespace tei = 'http://www.tei-c.org/ns/1.0';

declare function drama:htmlhead_drama($title) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)

<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap4-1/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/drama.css"/>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/solid.css" integrity="sha384-S2gVFTIn1tJ/Plf+40+RRAxBCiBU5oAMFUJxTXT3vOlxtXm7MGjVj62mDpbujs4C" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/brands.css" integrity="sha384-SYNjKRRe+vDW0KSn/LrkhG++hqCLJg9ev1jIh8CHKuEA132pgAz+WofmKAhPpTR7" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/fontawesome.css" integrity="sha384-0b7ERybvrT5RZyD80ojw6KNKz6nIAlgOKXIcJ0CV7A6Iia8yt2y1bBfLBOwoc9fQ" crossorigin="anonymous"/>
</head>

};

(: formatting - footer :)
declare function drama:footer () {
let $f := <footer class="footer">
<div class="container">
<h3> </h3>
<h1 class="text-center"><span class="fas fa-leaf" aria-hidden="true"></span> Drama Croaticum Latinum</h1>
<div class="row">
<div  class="col-md-9">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="/basex/static/gfx/ffzghrlogo.png"/> Filozofski fakultet</a> Sveučilišta u Zagrebu / <a href="http://www.ffzg.unizg.hr">Facultas philosophica</a> Universitatis Zagrabiensis</p> 
</div>
<div  class="col-md-3">
<p class="text-center"><span class="fas fa-feather-alt" aria-hidden="true"></span> <a href="http://croala.ffzg.unizg.hr">Croatiae</a> auctores Latini<br/>
<a href="http://github.com"><img src="/basex/static/gfx/GitHub-Mark-32px.png"/></a> in repositorio <a href="https://github.com/nevenjovanovic/croaladrama">Github</a></p> 
</div>
</div>
</div>
</footer>
return $f
};

declare function drama:htmlhead-tablesorter($title) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)
(: call scripts tablesorter, sugar :)
<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/static/dist/css//bootstrap4-1/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/drama.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/static/dist/css/bootstrap4-1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sugar/1.4.1/sugar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.23.5/js/jquery.tablesorter.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/solid.css" integrity="sha384-S2gVFTIn1tJ/Plf+40+RRAxBCiBU5oAMFUJxTXT3vOlxtXm7MGjVj62mDpbujs4C" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/brands.css" integrity="sha384-SYNjKRRe+vDW0KSn/LrkhG++hqCLJg9ev1jIh8CHKuEA132pgAz+WofmKAhPpTR7" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/fontawesome.css" integrity="sha384-0b7ERybvrT5RZyD80ojw6KNKz6nIAlgOKXIcJ0CV7A6Iia8yt2y1bBfLBOwoc9fQ" crossorigin="anonymous"/>
</head>

};

(: the same, for server / basex :)
declare function drama:htmlhead-tablesorter-server($title) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)
(: call scripts tablesorter, sugar :)
<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/basex/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap4-1/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/drama.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sugar/1.4.1/sugar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.23.5/js/jquery.tablesorter.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/solid.css" integrity="sha384-S2gVFTIn1tJ/Plf+40+RRAxBCiBU5oAMFUJxTXT3vOlxtXm7MGjVj62mDpbujs4C" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/brands.css" integrity="sha384-SYNjKRRe+vDW0KSn/LrkhG++hqCLJg9ev1jIh8CHKuEA132pgAz+WofmKAhPpTR7" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/fontawesome.css" integrity="sha384-0b7ERybvrT5RZyD80ojw6KNKz6nIAlgOKXIcJ0CV7A6Iia8yt2y1bBfLBOwoc9fQ" crossorigin="anonymous"/>
</head>

};

(: script for tablesorter, Croatian sorting order :)
declare function drama:tablescript () {
  let $script := element script {
    "
    $(function() {
  // define sugar.js Croatian sort order
  Array.AlphanumericSortOrder = 'AaBbCcČčĆćDdÐđEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsŠšTtUuVvWwZzŽžXxYy';
  Array.AlphanumericSortIgnoreCase = true;
  // see https://github.com/andrewplummer/Sugar/issues/382#issuecomment-41526957
  Array.AlphanumericSortEquivalents = {};
  
  $('table').tablesorter({
    theme : 'blue',
    // table = table object; get config options from table.config
    // column is the column index (zero-based)
    ignoreCase : false,
    textSorter : {
      1 : Array.AlphanumericSort,     // alphanumeric sort from sugar (http://sugarjs.com/arrays#sorting)
      
    }
  });
});
    "
    }
    return $script
};


(: drama functions :)

declare function drama:countbibentries($collection){
element p { "Notarum bibliographicarum " || count(collection($collection)//*:listBibl[@type='croala.drama.sekundarna']/*:bibl) || "." }
};

declare function drama:countplayentries($collection){
element p { "Notarum de dramatibus " || count(collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl) || "." }
};

declare function drama:getbibliolist($collection){
  let $bibliogr := collection($collection)//*:listBibl[@type='croala.drama.sekundarna']
  return element table { 
  attribute class {"tablesorter"},
  element thead {
    element tr {
      element td {"Annus"},
      element td {"Titulus"},
      element td {"Dramata"}
    }
  } ,
  element tbody { 
  
    for $title in $bibliogr/*:bibl
    let $titleref := $title/@xml:id
    let $refcount := count(drama:getbiblioref('#' || $titleref))
    order by $title collation "?lang=hr"
    
    return 
      if ($refcount > 0) then
    element tr {
      element td { data($title/*:date) },
    element td { data($title) },
    element td { 
      
    element a { 
    attribute href {'dramabib-titleref/' || $titleref} , 
    $refcount }
     
  }
  }
  else 
  element tr {
      element td { data($title/*:date) },
    element td { data($title) },
    element td { $refcount }
}
}
}
};

declare function drama:getbiblioref($biblioref){ 
for $dramaref in collection("croaladrama_db")//*:listBibl[@type='croala.drama']/*:bibl[*:relatedItem/*:listBibl/*:bibl/@corresp= $biblioref]
return element tr {
element td { $dramaref/@xml:id , $dramaref/*:title[1], $dramaref/*:date[1] , $dramaref/*:placeName[1] } 
}
};

declare function drama:biblioref-listd($refid) {
  element table {
  let $refid1 := $refid
  return element thead {
    element tr {
      element td { $refid1 , 
      element p { collection("croaladrama_db")//*:bibl[@xml:id=$refid1] } }
    }
  },
  element tbody {
    drama:getbiblioref('#' || $refid)
  }
}
};

(: report count of play records for century:)

declare function drama:dramachrono3($collection) {
  for $d in collection($collection)//*:listBibl[@type='croala.drama']/*:bibl[*:date/@period]
order by $d/*:date[1]/@period , $d/*:date[1]/@when
return substring-before($d/*:date[1]/@period, "_")
};

declare function drama:tablesaeculum($result){
  element div { 
  attribute class {"container"},
  element div {
    attribute class { "row" },
    map:for-each(
  $result,
  function($key,$value){
    element div { 
    attribute class {"col"},
    element div {
      attribute class { "card text-center text-white  bg-secondary mb-3" },
      element h3 {
        attribute class { "card-header"  },
         "Saeculum " || number($key) + 1 },
      element div {
        attribute class { "card-body" },
        element h5 {
          attribute class { "card-title" },
          element a { 
             attribute href {"http://croala.ffzg.unizg.hr/basex/dramachrono/" || $key } ,
    $value } }
  }
}
}
  }
)
}
}
};

(: return chronological list of plays as divs :)
declare function drama:dramachrono($collection) {
  for $d in collection($collection)//*:listBibl[@type='croala.drama']/*:bibl/*:date[@period]
order by $d/@period , $d/@when
let $zapis := $d/..
let $naslov := $d/../*:title[1]
return if ($naslov/text()) then element div {
  $zapis/*:author ,
  element title { data($naslov) } ,
  $d,
  $zapis/*:placeName
}
else 
element div { 
$zapis/*:author ,
element title { "TITULUS IGNORATUR"},
$d,
  $zapis/*:placeName
}
};

declare function drama:facet ( $naziv ) {
  let $map := map {
    "zapisi" : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]',
    "autori" : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:author',
    "osobe" : '//*:body/*:listBibl[@type="croala.drama"]//*:persName',
    'organizacije' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:orgName', 
    'razdoblja' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:date/@period', 
    'datumi' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:date', 
     'naselja' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:placeName',
     'lokacije' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]//*:address',
    'bibliografija' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:relatedItem/*:listBibl/*:bibl', 
   'RHK' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:ref', 
   'naslovi_latinski' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="lat" and text()]', 
  'naslovi_hrvatski' : '//*:body/*:listBibl[@type="croala.drama"]/*:bibl[@type="drama"]/*:title[@xml:lang="hrv" and text()]',
   'bibliografija_naslovi' : '//*:body/*:listBibl[@type="croala.drama.sekundarna"]/*:bibl'
  }
  let $i := xquery:eval(map:get($map,$naziv), map { '': db:open('croaladrama', 'drame.xml') })
for $ci in distinct-values($i)
let $cic := count($i[.=$ci])
order by $ci collation "?lang=hr"
return element div { 
  attribute class { "col-md-3"},
  element code { $ci || " (" || $cic || ")" 
}

}
};

(: return all plays for a given century :)
declare function drama:dramachronosaec($collection, $saec) {
  for $d in collection($collection)//*:listBibl[@type='croala.drama']/*:bibl[*:date[starts-with(@period,$saec)]]
order by $d/*:date[1]/@period , $d/*:date[1]/@when
return $d
};

(: return list of plays alphabetically by title :)
declare function drama:dramatituli($collection) {
  drama:titletable($collection , "Titulus", "Annus", "Locus", "Notae")
};

declare function drama:titletable($collection, $col1, $col2, $col3, $col4){
  element table {
    (: attribute class {"table"}, :)
  element thead {
    element tr {
      element th {$col1},
      element th {$col2},
      element th {$col3},
      element th {$col4}
    }
  } ,
  element tbody { 
  drama:dramaABC($collection)
}
}
};

(: Latin words for missing title :)
declare function drama:ignoratur($d){
  let $placeholder := "TITULUS IGNORATUR"
  let $naslov := if ($d/*:title[1]/string()) then $d/*:title[string()] 
  else if ($d/*:monogr/*:title[1]/string()) then $d/*:monogr/*:title[string()]
  else if ($d/*:msName) then element title { data($d/*:msName) }
  else if ($d//*:msItem/*:title) then $d//*:msItem/*:title
  else $placeholder
  return $naslov
};

(: Latin words for missing title, wrapped in title :)
declare function drama:ignoratur2($d){
  let $placeholder := element title { 
  namespace { "tei" } {"http://www.tei-c.org/ns/1.0"} ,
  "TITULUS IGNORATUR" }
  let $naslov := if ($d/*:title[1]/string()) then $d/*:title[string()] else $placeholder
  return $naslov
};

(: return alphabetical list of plays :)
declare function drama:dramaABC($collection) {
  for $d in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl
  let $naslov := drama:ignoratur($d)
  order by $naslov[1]
return element tr {
  element td { for $n in $naslov return $n } ,
  element td { $d/*:date[1]/@when/string() } ,
   element td { element a { 
  attribute href { "http://www.geonames.org/" || $d/*:placeName/@ref },
  $d/*:placeName
} },
  element td { for $row in $d/*[not(name()=("date", "title"))]
                return if ($row/descendant::*:sic) then element span { attribute class { "notarow"},  dramahelp:remove-elements-deep($row, "sic") }
                else element span { attribute class { "notarow"}, data($row)} }
}
};

declare function drama:dramaloca($collection) {
  for $d in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl
  let $naslov := drama:ignoratur($d)
  let $placeref := $d/*:placeName/@ref
  let $timeref := $d/*:date[1]/@when
  order by $placeref , $timeref
  return $d
};

declare function drama:tablefrommap($collection){
  let $map :=
map:merge(
for $p in drama:dramachrono3($collection)
let $d := $p
group by $d
return 
  map:entry( substring-before($d, "xx"), count($p) )
)
return drama:tablesaeculum($map)
};

(: return map of places of performances :)
declare function drama:placesmap($collection) {
let $maps := map:merge(
for $d in drama:dramaloca($collection)
let $place := $d/*:placeName
let $placestring := $place/string()
let $placeref := $place/@ref/string()
let $placemap := map:entry( $placestring, $placeref)
return $placemap
)
return $maps
};

(: return map of ids and placenames :)
declare function drama:idPlaceName($collection) {
let $maps := map:merge(
for $d in drama:dramaloca($collection)
let $place := $d/*:placeName
let $placestring := $place/string()
let $placeref := $place/@ref/string()
let $placerefmap := map:entry( $placeref , $placestring)
return $placerefmap
)
return $maps
};

(: return count of performances by place, unsorted :)
(: format as Bootstrap cards :)
declare function drama:perfbyplace($collection){
map:for-each(
  drama:placesmap($collection),
  function($key,$value){
    element div {
      attribute class { "col"},
  element div {
    attribute class { "card text-center text-white bg-info mb-3"},
    element h3 { 
    attribute class {"card-header"},
    $key
     },
    element div {
      attribute class {"card-body"},
    element h5 {
      attribute class {"card-title" },
    element a { 
    attribute href { "http://croala.ffzg.unizg.hr/basex/dramaloca2/" || $value },
    count(drama:dramaloca($collection)[*:placeName/@ref=$value]) }
  }  
    }
  }
}
}
  )
};

(: order places with counts of performances alphabetically :)
declare function drama:orderplacesabc($collection) {
element div {
  attribute class { "container"},
element div {
  attribute class { "row"},
for $d in drama:perfbyplace($collection)
order by $d
return $d
}
}
};

(: get all performances in place with a certain ID / locus :)
declare function drama:dramalocus1($collection, $locus) {
  for $d in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl[*:placeName/@ref=$locus]
  let $placeref := $d/*:placeName/@ref
  let $timeref := $d/*:date[1]/@when
  order by $timeref
  return $d
};

(: from a map with IDs and names, get name for ID :)
declare function drama:fromIDgetName($collection, $locus) {
let $map := drama:idPlaceName($collection)
return map:get($map, $locus)
};

(: display performances in a place: title with link to individual record, time, notes :)
(: return alphabetical list of plays :)
declare function drama:dramaLocusTabula($collection, $locus) {
  for $d in drama:dramalocus1($collection, $locus)
  return element tr {
  element td { drama:ignoratur2($d) } ,
  element td { $d/*:date[1]/@when/string() } ,
  element td { for $row in $d/*[not(name()=("date", "title"))]
                return 
                if ($row/descendant::*:sic) 
                then element span { attribute class { "notarow"},  dramahelp:remove-elements-deep($row, "sic") }
                else for $r in $row/* return element span { attribute class { "notarow"}, normalize-space($r) } }
}
};

(: put tbody with performances by place in a table :)
declare function drama:makeplacetable($collection, $locus){
  element table {
    (: attribute class {"table"}, :)
  element thead {
    element tr {
      element th { "Titulus "},
      element th { "Tempus" },
      element th { "Notae" }
    }
  } ,
  element tbody { 
  drama:dramaLocusTabula($collection, $locus)
}
}
};

(: retrieve all performances for a certain year or a set of years as regex :)

declare function drama:dramaAnnus1($collection, $annus) {
  for $d in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl[*:date[matches(@when, $annus)]]
  let $yearref := $d/*:date[1]/@when
  return $d
};

(: display performances in a year: TBA title with link to individual record, time, notes :)
(: return alphabetical list of plays? :)
declare function drama:dramaPerAnnumTabula($collection, $annus) {
  for $d in drama:dramaAnnus1($collection, $annus)
  return element tr {
  element td { drama:ignoratur2($d) } ,
  element td { $d/*:date[1]/@when/string() } ,
  element td { for $row in $d/*[not(name()=("date", "title"))]
                return 
                if ($row/descendant::*:sic) 
                then element span { attribute class { "notarow"},  dramahelp:remove-elements-deep($row, "sic") }
                else element span { attribute class { "notarow"}, normalize-space(data($row)) } }
}
};

(: put all performances for a certain period of years in a table:)

declare function drama:makeyearsettable($collection, $annus) {
  if ( drama:dramaAnnus1($collection, $annus) ) then
  element table {
    (: attribute class {"table"}, :)
  element thead {
    element tr {
      element th { "Titulus "},
      element th { "Tempus" },
      element th { "Notae" }
    }
  } ,
  element tbody { 
  drama:dramaPerAnnumTabula($collection, $annus)
}
}
else element div {
  element p { "Eo anno nullum drama in fontibus memoratur." }
}
};

(: return alphabetical list of books :)
declare function drama:dramaLibri($collection) {
  for $d in collection($collection)//*:listBibl[@type="croala.drama.libri"]/*
  let $naslov := drama:ignoratur($d)
  order by $naslov[1]
return element tr {
  element td { for $n in $naslov return $n } ,
  element td { $d/*:monogr/*:imprint/*:date[1]/@when/string() } ,
  element td { for $row in $d/*
                return if ($row/descendant::*:sic) then element span { attribute class { "notarow"},  dramahelp:remove-elements-deep($row, "sic") }
                else for $r in $row/* return element span { attribute class { "notarow"}, normalize-space(data($r)) } }
}
};

declare function drama:makebookstable($collection) {
  if ( drama:dramaLibri($collection) ) then
  element table {
    (: attribute class {"table"}, :)
  element thead {
    element tr {
      element th { "Titulus "},
      element th { "Annus" },
      element th { "Notae" }
    }
  } ,
  element tbody { 
  drama:dramaLibri($collection)
}
}
else element div {
  element p { "Nullum drama in libris inventum." }
}
};

(: a page for each drama :)
declare function drama:dramatitlepage2($collection, $dramaid) {
  let $i := collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl[@xml:id=$dramaid]
  return element div {
    attribute class { "dramainfo"},
    $i
  }
};

(: return list of persons annotated as thema in each play :)
declare function drama:personslist($collection){
  let $names :=
for $d in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl[*:note[@ana="tema" and *:persName]]
for $persname in $d/*:note[@ana="tema"]/*:persName[@ref]
return element pers { 
$d/@xml:id , $persname/@ref , normalize-space($persname/string()) }
return $names
};

(: from id to title :)
declare function drama:idToTitle($collection, $p){
  for $t in collection($collection)//*:listBibl[@type="croala.drama"]/*:bibl[@xml:id=$p]/*:title[1] return $t
};

(: link from title to record :)
declare function drama:fromTitleToRecord($collection, $p){
  let $title := drama:idToTitle($collection, $p)
return element a {
  attribute href { "http://croala.ffzg.unizg.hr/basex/dramasingulare/" || $p  },
  if (not($title/string())) 
  then "Titulus ignoratur" 
  else normalize-space($title/string()) }
};

(: from person ref to name :)
declare function drama:fromRefToName($ref){
  let $record := collection("croaladrama_personae_db")//*:listPerson[@type="croala.personae.fictae"]/*:person[@xml:id=substring-after($ref, "#")]
  return $record
};

declare function drama:personstable($collection){
  (: find all persName elements in bibl/note :)
  (: return result as tr / td :)
let $names :=
drama:personslist($collection)
for $n in $names
let $ref := $n/@ref
group by $ref
let $plays := distinct-values($n/@xml:id)
order by count($plays) descending
return element tr { 
  element td { normalize-space(drama:fromRefToName($ref)/*:persName[1]/string()) } , 
  element td { count($plays) } , 
  element td { 
    for $p in $plays
    return element p { drama:fromTitleToRecord($collection, $p) } }
}
};

declare function drama:makeheroesstable($collection) {
  if ( drama:personstable($collection) ) then
  element table {
    (: attribute class {"table"}, :)
  element thead {
    element tr {
      element th { "Heros "},
      element th { "Occurrit in dramatibus" },
      element th { "Dramatum tituli" }
    }
  } ,
  element tbody { 
  drama:personstable($collection)
}
}
else element div {
  element p { "Nulli heroes in dramatibus inventi." }
}
};