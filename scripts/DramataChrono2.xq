(:~
 : Return list of plays chronologically
 : version 2, for croaladrama_db
 : @author Neven Jovanović
 :)
import module namespace croala = "http://www.ffzg.unizg.hr/klafil/croala" at "../../repo/croala.xqm";
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at "../../repo/drama.xqm";

declare namespace page = 'http://basex.org/examples/web-page';

declare variable $title := "CroALa dramata: chronologice";
declare variable $collection := "croaladrama_db";


(:~
 : This function generates the welcome page.
 : @return HTML page
 :)
declare
  %rest:path(
  "/dramachrono2"
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
  function page:dramachrono2()
{

element html { drama:htmlhead_drama($title) ,
    <body>
<div class="container-fluid">
<div class="jumbotron">
    <h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span><span> </span> { $title } </h1>
    <div class="container-fluid">
      <div class="col-md-6 datum">
      <p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
      <p>Functionis indiculus: <tt>{rest:uri()}</tt>.</p>
      { drama:countbibentries($collection) }
      <p>Ut ordinem mutes, rubricam mutandam preme.</p>
      </div>
      <div class="col-md-6 dbinfo">
        {croala:infodb($collection)}
      </div>
     </div>
  </div>
  
<blockquote class="croala">
      <div class="container-fluid col-xs-8 col-md-offset-1">
      <h1>Dramata chronologice</h1>
 {
   drama:dramachrono()
 }
 
</div>
</blockquote>
     </div>
<hr/>
{ drama:footer() }
</div>
    </body>
}
};

return
