import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at "../../repo/drama.xqm";

(:~
 : Return list of plays for a year
 : allow regular expressions
 : year expression is the last argument in URL path
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

declare variable $title := "CroALa dramata: per annum";
declare variable $collection := "croaladrama_db";


(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/dramaperannum/{$annus}"
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
  function page:dramaperannum1($annus)
{

element html { drama:htmlhead_drama($title) ,
    <body>
<div class="container-fluid">
<div class="jumbotron">
    <h1><span class="fas fa-clock" aria-hidden="true"></span><span> </span> { $title } </h1>
    <div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
      
      </div>
      <div class="container">
      <div class="row">
      
        <div class="col-md-4 dbinfo">
        { "Vade retro ad ",
      element a {
        attribute href { "http://croala.ffzg.unizg.hr/basex/drama" },
        "incipit"
      },
    "." }
         </div>
         <div class="col-md-4 dbinfo">
        <p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
      { drama:countplayentries($collection) }
         </div>
        <div class="col-md-4 dbinfo">
        {croala:infodb($collection)}
         </div>
      </div>
      </div>
     </div>
  </div>
  

      <div class="container-fluid col-xs-8 col-md-offset-1">
      <blockquote class="croala">
      <h1>Dramata in { $annus } inventa sunt { count(drama:dramaAnnus1($collection, $annus)) || "."}</h1>
 {
   drama:makeyearsettable($collection, $annus)
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
