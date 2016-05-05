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
	erb "Hello!"
end

get '/NewPost' do
  @post = Post.new
  erb :NewPost
end

post '/NewPost' do
  @post = Post.new params[:bloger]
end