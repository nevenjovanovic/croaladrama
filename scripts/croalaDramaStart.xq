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
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> { element span {$title} }</h1>

<div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
      <p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
      </div>
      <div class="col-md-6 dbinfo">
        {croala:infodb($collection)}
      </div>
     </div>
</div>
<div class="container-fluid">
   
   { element h1 { 
   element a {
     attribute href {"http://croala.ffzg.unizg.hr/basex/dramachrono2"} , "Chronologice" }
      } }
   <h1>Tituli</h1>
   <h1>Loca</h1>
   <h1>Thematice</h1>
   { element h1 {
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

