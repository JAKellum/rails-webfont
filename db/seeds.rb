# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Category.create([
  {name: 'formal'},
  {name: 'casual'}
])

Pair.delete_all
Pair.create([
  { headline_font: 'Quando',
    body_font: 'Varela Round',
    category_id: Category.where(name: 'casual').first.id,
    slider1: 2,
    slider2: 3,
    slider3: 3
  },
{ headline_font: 'Montserrat',
    body_font: 'Balthazar',
    category_id: Category.where(name: 'formal').first.id,
    slider1: 5,
    slider2: 3,
    slider3: 2
  }
])
