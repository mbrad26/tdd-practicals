require 'sinatra/base'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect '/birthday_message'
  end

  get '/birthday_message' do
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    erb :birthday_message
  end

  run! if app_file == $0
end
 
