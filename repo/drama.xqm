module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama";

declare function drama:htmlhead_drama($title) {
  (: return html template to be filled with title :)
  (: title should be declared as variable in xq :)

<head><title> { $title } </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="icon" href="/static/gfx/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/drama.css"/>
</head>

};

(: formatting - footer :)
declare function drama:footer () {
let $f := <footer class="footer">
<div class="container">
<h3> </h3>
<h1 class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> Drama Croaticum Latinum</h1>
<div class="row">
<div  class="col-md-9">
<p class="text-center"><a href="http://www.ffzg.unizg.hr"><img src="/basex/static/gfx/ffzghrlogo.png"/> Filozofski fakultet</a> Sveučilišta u Zagrebu / <a href="http://www.ffzg.unizg.hr">Facultas philosophica</a> Universitatis Zagrabiensis</p> 
</div>
<div  class="col-md-3">
<p class="text-center"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> <a href="http://croala.ffzg.unizg.hr">Croatiae</a> auctores Latini<br/>
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
<link rel="stylesheet" type="text/css" href="/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/static/dist/css/drama.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/static/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sugar/1.4.1/sugar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.23.5/js/jquery.tablesorter.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/basexc.css"/>
<link rel="stylesheet" type="text/css" href="/basex/static/dist/css/drama.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sugar/1.4.1/sugar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.23.5/js/jquery.tablesorter.min.js"></script>
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
  for $d in collection($collection)//*:listBibl[@type='croala.drama']/*:bibl[*:date[1]/@period]
order by $d/*:date/@period , $d/*:date/@when
return substring-before($d/*:date/@period, "_")};

declare function drama:tablesaeculum($result){
  element table { 
  element thead {
    element tr {
      element td {"Saeculum"},
      element td { },
      element td { },
      element td { },
      element td { }
    }
  } ,
  element tbody {
  element tr {
    map:for-each(
  $result,
  function($key,$value){element td { "Saeculum " || $key || ": "
 , element a { 
 attribute href {"http://croala.ffzg.unizg.hr/basex/dramachrono/" || $key } ,
    $value } }
  }
)
  }
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
