ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/log_in' do
    @user = User.new
    erb :log_in
  end

  post '/log_in' do
    redirect ('/peeps')
  end


  post '/users' do
    @user = User.new(email: params[:email], name: params[:name],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:confirm_password] )

    if @user.save
      redirect ('/peeps')
    else
      flash.now[:errors]
      erb :sign_up
    end
  end

  get '/peeps' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
