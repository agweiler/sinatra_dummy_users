enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  #if validated

  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user.nil?
    erb :signup
  else
    session[:user] = @user
    # erb :secret
    redirect to '/secret'
  end
end

get '/signup' do

  erb :signup
end

post '/signup' do
  @user = User.create(params[:user])
  session[:user] = @user
  if @user.id.nil?
    redirect to '/signup'
  else
    # erb :secret
    redirect to '/secret'
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end

get '/secret' do
  if session[:user].nil?
    redirect to '/signup'
  else
    erb :secret
  end
end