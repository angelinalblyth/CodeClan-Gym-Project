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

get '/gym_classes' do
  @gym_classes = GymClass.all()
  erb (:gym_class)
end