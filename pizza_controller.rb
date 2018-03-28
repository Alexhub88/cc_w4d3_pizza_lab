require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')

# index  - shows the list of all the pizzas
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# new - allows the user to create a new pizza
get '/pizza_orders/new' do
  erb(:new)
end

# show - displays the details of a pizza order chosen by pizza ID
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end
#
#  create - saves a new pizza order to the database
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
#
# edit - allows the user to edit the details of a pizza order
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

# update - updates the database with the details from the Edit form
post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect "/pizza_orders/#{params[:id]}"
end

# destroy - deletes a pizza order from the database
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()

 redirect "/pizza_orders"  # redirects the user to the pizza order form
end
