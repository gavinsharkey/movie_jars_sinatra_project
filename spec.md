# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- - I wrote three migrations to create the *users*, *jars*, and *movies* tables.
- [x] Include more than one model class (e.g. User, Post, Category)
- - I have three models: User, Jar, and Movie
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- - The User class *has many* Jars, and the Jar class *has many* Movies
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- - Movies *belong to* the Jar class, and Jars *belong to* the User class 
- [x] Include user accounts with unique login attribute (username or email)
- - I added a validation to the User class that checks the uniqueness and format of an  
email before it's persisted to the database
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
