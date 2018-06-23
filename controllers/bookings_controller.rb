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

get '/gym_classes/:id/bookings' do
  @gym_class = GymClass.find(params[:id])
  @members = @gym_class.members()
  erb ( :"gym_class/bookings")
end

get '/gym_classes/:id/book_class' do
  @members = Member.all
  @gym_class_id = params[:id]
  @signed_up = GymClass.find(params[:id]).members.map {|member| member.id}
  
  erb(:"booking/new")
end

post '/gym_classes/:gym_class_id/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to "/gym_classes/#{params['gym_class_id']}/bookings"
end


get '/members/:id/bookings' do
  @members = Member.find(params[:id])
  @gym_classes = @members.booked_classes()
  erb ( :"member/bookings")
end

post '/members/:member_id/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to "/members/#{params['member_id']}/bookings"
end
