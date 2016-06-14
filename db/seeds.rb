# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories=['trabajo','comunidad','vivienda','servicios','personales','comercio']
trabajo=['administración','seguridad','transporte','educación']
comunidad=['actividades','eventos','politica']
vivienda=['alquiler','casa','habitación','oficina','comercial']
servicios=['belleza','legal','animales','mudanzas']
personales= ['amistad','mujeres','hombres']
comercio=['computadores','telefonos','antiguedades','deportes','electronica']

categories.each do |c|
	Category.find_or_create_by(nombre:c)
end

trabajo.each do |t|
Subcategory.where(nombre:t).find_or_create_by(category_id:Category.find_by_nombre(categories[0]).id)
end
comunidad.each do |c|
Subcategory.where(nombre:c).find_or_create_by(category_id:Category.find_by_nombre(categories[1]).id)
end
vivienda.each do |v|
Subcategory.where(nombre:v).find_or_create_by(category_id:Category.find_by_nombre(categories[2]).id)
end
servicios.each do |s|
Subcategory.where(nombre:s).find_or_create_by(category_id:Category.find_by_nombre(categories[3]).id)
end
personales.each do |p|
Subcategory.where(nombre:p).find_or_create_by(category_id:Category.find_by_nombre(categories[4]).id)
end
comercio.each do |c|
Subcategory.where(nombre:c).find_or_create_by(category_id:Category.find_by_nombre(categories[5]).id)
end