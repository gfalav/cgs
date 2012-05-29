cd ..
rails g scaffold proyecto proyecto:string desc:string comitente:string constructor:string proyectista:string fproyecto:date ubicacion:string expediente:string cond_e_id:integer cond_g_id:integer zona_id:integer tconstr_id:integer vanomax:decimal dretmax:decimal
rails g scaffold puntos punto:string proyecto_id:integer secuencia:integer latitud:decimal longitud:decimal distancia:decimal angulo:decimal
rails g scaffold conductor nombre:string diametro:decimal seccion:decimal peso:decimal rmec:decimal coef_e:decimal coef_t:decimal imax:decimal relec:decimal tmax:decimal tmed:decimal
rails g scaffold zona nombre:string
rails g scaffold condclima zona_id:integer nombre:string temp:decimal viento:decimal hielo:decimal
rails g scaffold tramo ttramo_id:integer secuencia:integer nombre:string cantidad:integer proyecto_id:integer
rails g scaffold ttramo tipo:string
rails g scaffold vano proyecto_id:integer nombre:string vano:decimal cond_e_id:integer cond_g_id:integer tiromax_e:decimal flechamax_e:decimal tma_e:decimal tiromax_g:decimal flechamax_g:decimal tma_g:decimal
rails g scaffold reltramovano tramo_id:integer vano_id:integer angulo:decimal
rails g scaffold calcmecanico vano_id:integer condclima_id:integer tension:decimal tiro:decimal flecha_t:decimal flecha_v:decimal flecha_h:decimal conductor_id:integer temp:decimal viento:decimal hielo:decimal
