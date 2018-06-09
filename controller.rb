require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/member.rb')
require_relative('./models/gym_class.rb')
require_relative('./models/booking.rb')
also_reload('./models/*')


get '/' do # dashboard
  erb(:home)
end


### All Member functions

get '/members' do # members index
  @members = Member.all()
  erb (:members)
end

get '/members/new' do # new member
  @members = Member.all()
  erb(:new_member)
end

get '/members/:id' do #show individual member
  @member = Member.find(params[:id])
  erb(:show_member)
end

post '/members' do # create
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id/edit' do # edit
  @member = Member.find(params[:id])
  erb(:edit_member)
end

post '/members/:id' do #update
  Member.new(params).update
  redirect to "/members/#{params['id']}"
end

post '/members/:id/delete' do # delete
  Member.delete( params[:id])
  # member.delete()
  redirect to '/members'
end

### All Gym Class functions

get '/gym_classes' do
  @gym_classes = GymClass.all()
  erb (:gym_class)
end

get '/gym_classes/new' do # create new class
  @gym_classes = GymClass.all()
  erb(:new_gym_class)
end

get '/gym_classes/:id' do # show class
  @gym_class = GymClass.find(params[:id])
  erb(:show_gym_class)
end

post '/gym_classes' do # create
  GymClass.new(params).save
  redirect to '/gym_classes'
end

get '/gym_classes/:id/edit' do # edit
  @gym_class = GymClass.find(params[:id])
  erb(:edit_class)
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
