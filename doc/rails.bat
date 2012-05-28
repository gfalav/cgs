cd ..
rails g scaffold proyecto proyecto:string desc:string comitente:string constructor:string proyectista:string fproyecto:date ubicacion:string expediente:string cond_e_id:integer cond_g_id:integer zona_id:integer tconstr_id:integer vanomax:decimal dretmax:decimal
rails g scaffold puntos punto:string proyecto_id:integer secuencia:integer latitud:decimal longitud:decimal distancia:decimal angulo:decimal
rails g scaffold conductor nombre:string diametro:decimal seccion:decimal peso:decimal rmec:decimal coef_e:decimal coef_t:decimal imax:decimal relec:decimal tmax:decimal tmed:decimal
rails g scaffold zona nombre:string
rails g scaffold condclima zona_id:integer nombre:string temp:decimal viento:decimal hielo:decimal