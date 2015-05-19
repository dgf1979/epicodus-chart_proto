require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/test') do
  @test_var = 'Sinatra OK'
  @db = "ActiveRecord Using: #{ActiveRecord::Base.connection_config[:database].upcase}"
  erb(:test)
  #redirect to('/')
end

get('/') do
  Flavor.all.each { |f| f.destroy() }
  Person.all.each { |p| p.destroy() }

  chocolate = Flavor.create({name: 'Chocolate'})
  vanilla = Flavor.create({name: 'Vanilla'})
  grape = Flavor.create({name: 'Grape'})

  Person.create({name: 'Sue', flavor_id: chocolate.id})
  Person.create({name: 'Bill', flavor_id: chocolate.id})
  Person.create({name: 'Bob', flavor_id: chocolate.id})
  Person.create({name: 'Joe', flavor_id: chocolate.id})
  Person.create({name: 'Anne', flavor_id: vanilla.id})
  Person.create({name: 'Suresh', flavor_id: vanilla.id})
  Person.create({name: 'Andy', flavor_id: vanilla.id})
  Person.create({name: 'Jane', flavor_id: vanilla.id})
  Person.create({name: 'James', flavor_id: grape.id})
  Person.create({name: 'Ryan', flavor_id: grape.id})

  erb(:pie)
end
