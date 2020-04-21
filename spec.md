# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- - I initialized the project directory with the Corneal gem
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
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- - A user can make a new jar, view a jar, update the contents of a jar, and delete a jar:  
Create:
```
get '/jars/new' do
  redirect_if_not_logged_in
  erb :"jars/new"
end

post '/jars' do
  if !params[:jar][:name].empty?
    @jar = current_user.jars.create(params[:jar])

    params[:movies].each do |movie|
      @jar.movies.create(movie) if !movie[:title].empty?
    end

    redirect "/jars/#{@jar.id}"
  else
    redirect '/jars/new'
  end
end
```  
Read:  
  ```
  get '/jars/:id' do
    redirect_if_not_logged_in
    @jar = current_user.jars.find_by(id: params[:id])
    if @jar
      session[:jar_id] = @jar.id
      erb :"jars/show"
    else
      redirect '/jars'
    end
  end
  ```  
Update:  
```
get '/jars/:id/edit' do
  redirect_if_not_logged_in
  @jar = current_user.jars.find_by(id: params[:id])
  if @jar
    erb :"jars/edit"
  else
    redirect '/jars'
  end
end

patch '/jars/:id' do
  if !params[:jar][:name].empty?
    @jar = current_user.jars.find(params[:id])
    @jar.update(params[:jar])
    redirect "/jars/#{@jar.id}"
  else
    redirect "/jars/#{params[:id]}/edit"
  end
end
```
and Delete:  
```
delete '/jars/:id' do
  current_user.jars.find_by(id: params[:id]).destroy
  redirect '/jars'
end
```
- [x] Ensure that users can't modify content created by other users
- - For all of my routes that aren't for login/signup, I check if the user is logged in. If not,  
I send them to the login screen. Also, when a user goes to view or edit a jar, the controller will  
look for that jar in the current user's jars array,  
```
get '/jars/:id/edit' do
  redirect_if_not_logged_in  # Verifies they're logged in
  @jar = current_user.jars.find_by(id: params[:id])  # Verifies they are who they say they are
  if @jar  # @jar will be nil if the controller couldn't find the jar in the users jars
    erb :"jars/edit"
  else
    redirect '/jars'
  end
end
```
and they will be redirected if that jar isn't theirs.
- [x] Include user input validations
- - Firstly, the User class validates the format of an email when saved:  
```
class User < ActiveRecord::Base
  has_many :jars
  has_many :movies, through: :jars

  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid"}
  validates :name, presence: true
end
```
Also, when a user goes to create/update a jar or movie, it validates that there is a name/title:  
```
post '/jars' do
    if !params[:jar][:name].empty? # Checks that the 'name' field isn't empty
      @jar = current_user.jars.create(params[:jar])

      params[:movies].each do |movie|
        @jar.movies.create(movie) if !movie[:title].empty?
      end

      redirect "/jars/#{@jar.id}"
    else
      redirect '/jars/new' # If it is, they're redirected back to the form
    end
  end
```
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
