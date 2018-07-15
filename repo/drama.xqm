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
<a href="http://github.com"><img src="/basex/static/gfx/GitHub-Mark-32px.png"/></a> Repositorium <a href="https://github.com/nevenjovanovic/croaladrama">Github</a></p> 
</div>
</div>
</div>
</footer>
return $f
};

(: drama functions :)

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
  else ()
}

}
};

declare function drama:getbiblioref($biblioref){ 
for $dramaref in collection('croalabib')//*:listBibl[@type='croala.drama']/*:bibl[*:relatedItem/*:listBibl/*:bibl/@corresp= $biblioref]
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
      element p { collection('croalabib')//*:bibl[@xml:id=$refid1] } }
    }
  },
  element tbody {
    drama:getbiblioref('#' || $refid)
  }
}
};

(: return chronological list of plays as divs :)
declare function drama:dramachrono() {
  for $d in collection("croaladrama")//*:listBibl[@type='croala.drama']/*:bibl/*:date[@period]
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
