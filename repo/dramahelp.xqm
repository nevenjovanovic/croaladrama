module namespace dramahelp = "http://www.ffzg.unizg.hr/klafil/dramahelp";

declare namespace tei = 'http://www.tei-c.org/ns/1.0';

(: remove descendant elements based on name :)

declare function dramahelp:substring-after-if-contains
  ( $arg ,
    $delim ) {

   if (contains($arg,$delim))
   then substring-after($arg,$delim)
   else $arg
 } ;

declare function dramahelp:name-test
  ( $testname ,
    $names ) {

$testname = $names
or
$names = '*'
or
dramahelp:substring-after-if-contains($testname,':') =
   (for $name in $names
   return substring-after($name,'*:'))
or
substring-before($testname,':') =
   (for $name in $names[contains(.,':*')]
   return substring-before($name,':*'))
 } ;

declare function dramahelp:remove-elements-deep
  ( $nodes ,
    $names ) {

   for $node in $nodes
   return
     if ($node instance of element())
     then if (dramahelp:name-test(name($node),$names))
          then ()
          else element { node-name($node)}
                { $node/@*,
                  dramahelp:remove-elements-deep($node/node(), $names)}
     else if ($node instance of document-node())
     then dramahelp:remove-elements-deep($node/node(), $names)
     else $node
 } ;
