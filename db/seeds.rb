User.destroy_all
Pet.destroy_all
Todo.destroy_all
PetTodo.destroy_all

10.times do 
    User.create(email: Faker::Internet.unique.email, password: "password", name: Faker::Name.name)
end

30.times do
    Pet.create(name: Faker::Books::Lovecraft.deity, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

100.times do
    users_with_pets = User.all.select { |user| user.pets.count > 0 }
    user = users_with_pets.shuffle.first
    i = 0
    pets_array = []
    rand(1..user.pets.count).times do
        pets_array << user.pets[i]
        i += 1
    end
    todo = Todo.create(name: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, datetime: rand(30.days).seconds.from_now, complete: Faker::Boolean.boolean, pets: pets_array)
end