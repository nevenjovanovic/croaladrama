(: Create DB from XML with data of fictional persons from Croatian Latin drama performances :)
let $path := '/home/neven/Repos/croaladrama/data/personaefictae'
return db:create('croaladrama_personae_db', $path , (), map { 'chop': false() } )