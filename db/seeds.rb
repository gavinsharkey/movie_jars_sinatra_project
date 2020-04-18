5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  2.times do
    jar = user.jars.create(name: Faker::Relationship.familial)
    jar.movies.create(title: Faker::Book.title)
    jar.movies.create(title: Faker::Book.title)
    jar.movies.create(title: Faker::Book.title)
    jar.movies.create(title: Faker::Book.title)
    jar.movies.create(title: Faker::Book.title)
    jar.save
  end
  user.save
end