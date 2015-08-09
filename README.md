<!-- Logging steps to create the grammar-questions app -->

<!-- Creating a new Rails app -->
rails new -d postgresql grammar-questions

<!-- Create new Postgresql database -->
rake db:create

<!-- Creating a questions controller with full CRUD -->
rails g controller questions index new create show edit update destroy

<!-- Routes are now set up, pointing the root to questions#index -->
root 'questions#index'
resources :questions (setting up all available routes for full CRUD)

<!-- Creating answeres controller with full CRUD -->
rails g controller answers index new create show edit update destroy

<!-- Creating model for questions -->
rails g model Question question:string description:text

<!-- Creating model for answers -->
rails g model Answer answer:string description:text

<!-- BEFORE running rake db:migrate, set up association between questions and answers by editing the models and migrations; foreign key will be set up in the Answer migration; each answer will be associated with one question -->

Question: has_many :answers
Answer: belongs_to :question

<!-- Add this line to the Answer model migration -->
t.belongs_to :owner

<!-- THEN run rake db:migrate to set up the tables in our database -->
rake db:migrate

<!-- Edited answer model to remove "description" by creating a new migration-->
rails g migration RemoveDescriptionFromAnswers description:text

<!-- Setting up routes and controller actions -->

<!-- Implementing Auth -->

<!-- Creating a User model -->
rails g model User email password_digest

<!-- Migrate the new model to the database -->
rake db:migrate

<!-- Generating a Users controller -->
rails g controller users first_name last_name email password

<!-- adding a users foreign key to questions to associate the two models -->
rails generate migration AddUserRefToQuestions user:references

<!-- migrating the update -->
rake db:migrate
