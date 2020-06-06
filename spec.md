# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class. -- User, Pet, Todo, and PetTodo(a model representing a join table)
- [x] Include at least one has_many relationship on your User model -- User has many pets and many todos
- [x] Include at least one belongs_to relationship on another model -- Pets belong to User, and Todos belong to User
- [x] Include user accounts with unique login attribute -- Only able to sign up with a unique email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -- Both Todos and Pets have the 7 RESTful routes and users are able to perform all of the CRUD actions on them
- [x] Ensure that users can't modify content created by other users -- Users can only modify their own content, they actually can't even view content that belongs to other users.
- [x] Include user input validations 
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message( I tried to do this, I may have forgotten a few time)