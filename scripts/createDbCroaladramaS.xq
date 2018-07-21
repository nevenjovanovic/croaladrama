(: Create DB from XML with data of Croatian Latin drama performances :)
let $path := '/home/croala/croaladrama/data/'
return db:create('croaladrama_db', $path , (), map { 'chop': false() } )