Grocery List
  has many groceries
  groceries have name, quantity, price(optional?)
  can manually add items
  can display list from current user (belongs_to user)

Users 
  name, login, email, password(encrypted!!)
  has own grocery list
  can share list with other users?

Grocery
  name, price?
  belongs_to pantry list, grocery list, recipe
  can create new item

Pantry List
  has many groceries
  Almost empty adds to grocery list

Recipe (maybe?)
  has many groceries
  can deplete from pantry list
  can create new recipe