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

let $title := "CroALa: drama Croaticum Latinum"
return
element html { drama:htmlhead_drama($title) ,

<body text="#000000">
<div class="header">
    <ul class="nav nav-pills pull-right">
    </ul>
    <h3 class="text-muted"> </h3>
  </div>
<div class="container">
<div class="jumbotron">
<h1><span class="glyphicon glyphicon-th" aria-hidden="true"></span> CroALa: drama Croaticum Latinum</h1>

<p><a href="http://croala.ffzg.unizg.hr">CroALa</a>, { current-date() }.</p>
<p>Functio nominatur: {rest:uri()}.</p>
<p>DB: { data(db:info("croaladrama_db")/*:databaseproperties/(*:name , *:timestamp))
}</p>
</div>
<div class="container-fluid">

<blockquote class="croala">
    
    
</blockquote>
     <p/>
     </div>
<hr/>
{ croala:footer() }
</div>
</body>
}
};

return

