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
