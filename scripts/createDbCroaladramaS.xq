(: Create DB from XML with data of Croatian Latin drama performances :)
let $path := '/home/croala/croaladrama/data/manifestacije/'
return db:create('croaladrama_db', $path , (), map { 'chop': false() } )