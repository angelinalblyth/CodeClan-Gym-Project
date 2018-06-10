require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/gym_class.rb' )
also_reload( '../models/*' )

## All booking functions


get '/booking' do # table of bookings
  @bookings = Booking.all()
  erb (:"booking/index")
end
