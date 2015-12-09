# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  1..40.times do |i|
    Product.create(image_url:   'arco-urfass_thumb180.jpg',    
      price: 36.00,
      bottle_size: "large",
      company: "Ass2",
      country: "China",
      grape_type: "White",
      suit_vegetarian: "Yes",
      description: "#{i}#{i}#{i}#{i}",
      title: "#{i}#{i}#{i}#{i}lalalalallalalalal#{i}#{i}",
      supplier_id: "12345")
end
