10.times do 
    # I wanted the names and the emails to match up a bit better...
    name = Faker::Name.name
    User.create(email: Faker::Internet.unique.email(name: name, separators: '_'), password: "password", name: name)
end

5.times do
    Pet.create(name: Faker::Books::Lovecraft.deity, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

5.times do
    Pet.create(name: Faker::Ancient.god, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

5.times do
    Pet.create(name: Faker::Games::SuperSmashBros.fighter, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

5.times do
    Pet.create(name: Faker::Games::Zelda.character, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

5.times do
    Pet.create(name: Faker::Games::Fallout., species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end

5.times do
    Pet.create(name: Faker::FunnyName.name, species: Faker::Creature::Animal.name, birthday: Faker::Date.between(from: 5.year.ago, to: Date.today), user: User.all.shuffle.first)
end


100.times do
    #trying to simulate how it would actually work using the app. A user must first be created, and then must have pets before creating todo list items.

    #making sure I only grab users with pets
    users_with_pets = User.all.select { |user| user.pets.count > 0 }
    #random user
    user = users_with_pets.shuffle.first
    i = 0
    pets_array = []
    #selects a random number of the users pets, adds them to an array, the todos's pets will be equal to this array
    #this simulates how a user will have to check which pets the todo is for when creating a todo list item
    rand(1..user.pets.count).times do
        pets_array << user.pets[i]
        i += 1
    end
    Todo.create(name: "#{Faker::Verb.base} #{RandomWord.nouns.next.gsub("_"," ")}".titleize, description: Faker::Lorem.paragraphs[0], datetime: Faker::Time.between(from: Faker::Time.backward(days: 7), to: Faker::Time.forward(days: 30)), complete: Faker::Boolean.boolean, pets: pets_array)
end