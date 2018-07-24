import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at "../../repo/drama.xqm";

(: croalaDramaStart: landing page for exploring Croatian Latin drama bibliography :)

declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "html";

declare variable $title := "CroALa: drama Croaticum Latinum";
declare variable $collection := "croaladrama_db";

(:~
 : This function returns an XML response message.
 : @param $world  string to be included in the response
 : @return response element 
 :)
declare
  %rest:path("/drama")
  %rest:GET
  function page:croaladramastart()
{
  (: HTML template starts here :)

element html { drama:htmlhead_drama($title) ,

<body text="#000000">
<div class="jumbotron">
<h1><span  class="fas fa-th" aria-hidden="true"></span> { element span {$title} }</h1>

<div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
      <p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
      { drama:countplayentries($collection) }
      </div>
      <div class="col-md-6 dbinfo">
        {croala:infodb($collection)}
      </div>
     </div>
</div>
<div class="container-fluid">

{ element h1 {
     element span {
       attribute class { "fas fa-book" },
       attribute aria-hidden { "true" }
       } , 
   element a {
     attribute href {"http://croala.ffzg.unizg.hr/basex/dramalibri"} , "Libri scripti et impressi" }
   } }
   
   { element h1 {
     element span {
       attribute class { "fas fa-clock" },
       attribute aria-hidden { "true" }
       } , 
       "Chronologice – ",
   element a {
     attribute href {"http://croala.ffzg.unizg.hr/basex/dramachrono2"} , "omnia" }
      } } 
      
      
      
      { 
      element h2 { "Per saecula"} ,
  drama:tablefrommap($collection)  
  } 
  
  { element h3 { "Per annos quoslibet"} ,
    element p { "Annum numerice scribe aut utere expressione regulari, ut illustratur URL indiculis quae sequuntur: " ,
    element br {},
  element a {
    attribute href { "http://croala.ffzg.unizg.hr/basex/croaladramaperannum/1754" },
    "croala.ffzg.unizg.hr/basex/croaladramaperannum/1754"
  },
  element br {},
  element a {
    attribute href { "http://croala.ffzg.unizg.hr/basex/croaladramaperannum/165.*" },
    "croala.ffzg.unizg.hr/basex/croaladramaperannum/165.*"
  },
  element br {},
   element a {
    attribute href { "http://croala.ffzg.unizg.hr/basex/croaladramaperannum/17[23].*" },
    "croala.ffzg.unizg.hr/basex/croaladramaperannum/17[23].*"
  }
} }
  
   { element h1 {
     element span {
       attribute class { "fas fa-sort-alpha-down" },
       attribute aria-hidden { "true" }
       } , 
       "Tituli ",
   element a {
     attribute href {"http://croala.ffzg.unizg.hr/basex/dramatituli"} , "omnes alphabetice"  }
      } }
   { element h1 {
     element span {
       attribute class { "fas fa-map-marker-alt" },
       attribute aria-hidden { "true" }
       } , 
       "Loca ",
   element a {
     attribute href {"http://croala.ffzg.unizg.hr/basex/dramaloca"} , "omnia" }
      } }
   { drama:orderplacesabc($collection) } 
  
   <h1><span class="fas fa-archive" aria-hidden="true"></span> Thematice</h1>
   
   { element h1 {
      element span {
       attribute class { "fas fa-file-alt" },
       attribute aria-hidden { "true" }
       } , 
     element a { 
     attribute href { "http://croala.ffzg.unizg.hr/basex/dramabib" } , 
     "Fontes et alia opera docta"
   }
 } }
   
     </div>
<hr/>
{ drama:footer() }

</body>
}
};

return

