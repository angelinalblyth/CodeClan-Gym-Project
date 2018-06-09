require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/members_controller')

also_reload('./models/*')

get '/' do
  erb(:index)
end 
