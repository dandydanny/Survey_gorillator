enable :sessions

get '/' do
  erb :index
end

get '/survey_list' do 
	# ask instructor about conventional way to name routes. 
	erb :survey_list 
end 

post '/log_in' do 
	@user = User.find_by_email(params[:email])
	if @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect to('/user_portal')
	else
		redirect to('/')
	end
end

get '/signup' do
	erb :signup
end

post '/signup' do
	# create user with data given
	@user = User.create(email: params[:email], password: params[:password])
end

get '/user_portal' do
	erb :user_portal
end

get '/submit_survey' do
	erb :submit_survey
end

post '/submit_survey' do
	# tabulate received data
	redirect to('/user_portal')
end

get '/create_survey' do
	erb :create_survey
end

post '/create_survey' do
	#add newly created survey into database
	redirect to('/user_portal')
end

