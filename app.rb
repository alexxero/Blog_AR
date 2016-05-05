#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:Blog.db"

class Post < ActiveRecord::Base

end

class Comment < ActiveRecord::Base

end

get '/' do
  @posts = Post.order "created_at DESC"
	erb :index
end

get '/NewPost' do
  @post = Post.new
  erb :NewPost
end

post '/NewPost' do
  @post = Post.new params[:bloger]
  @post.save

  if @post.save
    erb "<h3>Пост добавлен!</h3>"
  else
    @error = @post.errors.full_messages.first
    erb :NewPost
  end
end

get '/post/:id' do
  @postid = Post.find(params[:id])
  erb :post
end

after do
  ActiveRecord::Base.connection.close
end