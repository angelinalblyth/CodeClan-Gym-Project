require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
require_relative('controllers/gym_classes_controller')
require_relative('controllers/bookings_controller')


get '/' do # dashboard
  erb(:home)
end
