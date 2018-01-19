# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used Sinatra...
- [x] Use ActiveRecord for storing information in a database - ActiveRecord implemented
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - User, Grocery, Recipe
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - Users have many Recipes, Recipes have many Groceries
- [x] Include user accounts - Can create/login/logout Users
- [x] Ensure that users can't modify content created by other users - user can't change/delete Recipes they don't own
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Groceries and Recipes both have CRUD
- [x] Include user input validations - All inputs required and username uniqness verified
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - redirects to self with flash message error
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message