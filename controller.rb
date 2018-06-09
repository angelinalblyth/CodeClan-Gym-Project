require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/member.rb')
require_relative('./models/gym_class.rb')
require_relative('./models/booking.rb')
also_reload('./models/*')


get '/' do
  erb(:home)
end

get '/members' do
  @members = Member.all()
  erb (:members)
end

get '/members/new' do
  @members = Member.all()
  erb(:new_member)
end

get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:show_member)
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:edit_member)
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end



get '/gym_classes' do
  @gym_classes = GymClass.all()
  erb (:gym_class)
end

get '/gym_classes/:id' do
  @gym_class = GymClass.find(params[:id])
  erb(:show_gym_class)
end
