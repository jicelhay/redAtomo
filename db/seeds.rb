# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Crear Profesores
juan = User.create(email: 'juan.celhay@gmail.com',
             password: 'mamamia123',
             name: 'Juan Celhay',
             password_confirmation: 'mamamia123',
             teacher: true)
#Crear Colegios
School.create(name: 'Colegio SiemprePenca')

#Crear Cursos
example_class = SchoolClass.create(name: '3°A', securityCode: '12345', user_id: 1, school_id: 1)

#Crear Apoderados
pedro = User.create(email: 'psaratscheff@gmail.com',
             password: 'mamamia123',
             name: 'Pedro Saratscheff',
             password_confirmation: 'mamamia123',
             teacher: false)

diego = User.create(email: 'difernandez@uc.cl',
             password: 'mamamia123',
             name: 'Diego Fernandez',
             password_confirmation: 'mamamia123',
             teacher: false)

ParentObligation.create(user_id: pedro.id,school_class_id: example_class.id)
ParentObligation.create(user_id: diego.id,school_class_id: example_class.id)

#Crear Avisos
Post.create(title: 'Paseo de curso', body: 'El paseo de curso se cancelará por mal tiempo. Agradezco su comprensión'+
'y les aseguro que no fue una decisión facil. Que estén muy bien.', user_id: juan.id, school_class_id: example_class.id)
Post.create(title: 'Aviso sobre notas de alumnos', body: 'Les comento a todos que las notas de la prueba de Matemáticas'+
'del jueves pasado estuvieron pésimas. No aceptaré ninguna recorrección.', user_id: juan.id, school_class_id: example_class.id)

p "Información cargada. Posts actuales: #{Post.count} Users actuales: #{User.count} Schools actuales: #{School.count}"
