
 

SET @fecha='2016-09-02 00:00:00';

 

/* Agrupación por horas */

select name, hour(dt),count(*) from hesk_replies

where

dt >= @fecha

AND

respuestaPccomponentes = 's'

AND

(

name in (

'Alejandro J.',

'Alejandro Vivo',

'Antonio Pérez',

'Bernardo Esteban',

'Braulio Puche',

'Daniel Barba',

'David Pérez',

'Esther Reverte',

'Germán Celdran',

'Gines Aliaga',

'Javier Dolera',

'Jesús Cano',

'Jesús Escolar',

'Jonatán Pallarés',

'Jorge Vivo',

'Jose A Garcia',

'Carlos Lacal',

'Jose Manuel Fuella',

'Jose G',

'José María Jiménez',

'Jose M. Rodriguez',

'Luis Maestre',

'Mar Martínez - Dpto Atención al cliente',

'Martín Aroca',

'Miguel Lázaro',

'Pascual Muñoz',

'Pedro De Pedro',

'Silvia Núñez',

'Verónica Cerón',

'Victor - Dpto Atención al cliente',

'Daniel Espín',

'Angela Moreira',

'Araceli Rodriguez',

'Arturo J.',

'Christian Grunwald',

'Cristina Rodriguez',

'Eva Mayor',

'Juan José Jimenez',

'Victor Segura',

'Virginia Cánovas',

'Maribel Torres',

'Alejandro Pereñíguez',

'Ana María Cano',

'Antonio Martínez',

'Antonio Palacios',

'Guillermo Navarro'

 

)

)

group by name, hour(dt)

order by name, hour(dt);

 

SET @fecha='2016-08-31 00:00:00';

 

/* Agrupación del día */

 

select name, day(dt),count(*) from hesk_replies

where

dt >= @fecha

AND

respuestaPccomponentes = 's'

AND

(

name in (

'Alejandro J.',

'Alejandro Vivo',

'Antonio Pérez',

'Bernardo Esteban',

'Braulio Puche',

'Daniel Barba',

'David Pérez',

'Esther Reverte',

'Germán Celdran',

'Gines Aliaga',

'Javier Dolera',

'Jesús Cano',

'Jesús Escolar',

'Jonatán Pallarés',

'Jorge Vivo',

'Jose A Garcia',

'Carlos Lacal',

'Jose Manuel Fuella',

'Jose G',

'José María Jiménez',

'Jose M. Rodriguez',

'Luis Maestre',

'Mar Martínez - Dpto Atención al cliente',

'Martín Aroca',

'Miguel Lázaro',

'Pascual Muñoz',

'Pedro De Pedro',

'Silvia Núñez',

'Verónica Cerón',

'Victor - Dpto Atención al cliente',

'Daniel Espín',

'Angela Moreira',

'Araceli Rodriguez',

'Arturo J.',

'Christian Grunwald',

'Cristina Rodriguez',

'Eva Mayor',

'Juan José Jimenez',

'Victor Segura',

'Virginia Cánovas',

'Maribel Torres',

'Alejandro Pereñíguez',

'Ana María Cano',

'Antonio Martínez',

'Antonio Palacios',

'Guillermo Navarro'

 

)

)

group by name, day(dt)

order by name, day(dt)

 

 