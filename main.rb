#ecoding: utf-8
require 'sinatra'
require 'haml'
require 'sass-rails'

get '/' do
  Encoding.default_internal = nil
  haml :index, :layout => true
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"stylesheets/#{params[:name]}")
end

helpers do
  def partial(page, options={})
    haml page.to_sym, options.merge!(:layout => false)
  end
end
