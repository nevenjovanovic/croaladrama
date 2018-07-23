import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at "../../repo/drama.xqm";

(:~
 : Return list of plays for a place, chronologically ordered
 : place is the last argument in URL path
 : for croaladrama_db
 : @author Neven Jovanović
 :)
declare namespace page = 'http://basex.org/examples/web-page';
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:doctype-system  "http://www.w3.org/TR/html4/loose.dtd";
declare option output:doctype-public "-//W3C//DTD HTML 4.01 Transitional//EN";
declare option output:omit-xml-declaration "no";
declare option output:media-type "text/html";
declare option output:method "xhtml";

declare variable $title := "CroALa dramata: per locum";
declare variable $collection := "croaladrama_db";


(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/dramaloca2/{$locus}"
)
  %output:method(
  "xhtml"
)
  %output:omit-xml-declaration(
  "no"
)
  %output:doctype-public(
  "-//W3C//DTD XHTML 1.0 Transitional//EN"
)
  %output:doctype-system(
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
)
  %rest:GET
  function page:dramalocus1($locus)
{

element html { drama:htmlhead_drama($title) ,
    <body>
<div class="container-fluid">
<div class="jumbotron">
    <h1><span class="fas fa-align-justify" aria-hidden="true"></span><span> </span> { $title } </h1>
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
  

      <div class="container-fluid col-xs-8 col-md-offset-1">
      <blockquote class="croala">
      <h1>Dramata in { drama:fromIDgetName($collection,$locus) }</h1>
 {
   drama:makeplacetable($collection, $locus)
 }
 

</blockquote>
</div>
     </div>
<hr/>
{ drama:footer() }
    </body>
}
};

return
