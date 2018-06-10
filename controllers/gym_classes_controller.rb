require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_class.rb' )
also_reload( '../models/*' )

### All Gym Class functions

get '/gym_classes' do
  @gym_classes = GymClass.all()
  erb (:"gym_class/index")
end

get '/gym_classes/new' do # create new class
  @gym_classes = GymClass.all()
  erb(:"gym_class/new")
end

get '/gym_classes/:id' do # show class
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_class/show")
end

post '/gym_classes' do # create
  GymClass.new(params).save
  redirect to '/gym_classes'
end

get '/gym_classes/:id/edit' do # edit
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_class/edit")
end

post '/gym_classes/:id' do #update
  GymClass.new(params).update
  redirect to "/gym_classes/#{params['id']}"
end

post '/gym_classes/:id/delete' do # delete
  GymClass.delete( params[:id])
  # member.delete()
  redirect to '/gym_classes'
end


### Booking views


get '/gym_classes/:id/bookings' do
  @gym_class = GymClass.find(params[:id])
  @members = @gym_class.members()
  erb ( :"gym_class/bookings")
end


get '/gym_classes/:id/book_class' do
  
end
