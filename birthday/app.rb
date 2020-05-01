require 'sinatra/base'
require './lib/check_birthday'

class Birthday < Sinatra::Base
  configure(:development) { set :session_secret, 'set' }
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    p params
    redirect '/birthday_message'
  end

  get '/birthday_message' do
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    @birthday = CheckBirthday.new(@day, @month)
    erb :birthday_message
  end

  run! if app_file == $0
end
