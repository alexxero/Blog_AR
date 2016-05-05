#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:Blog.db"

class Post < ActiveRecord::Base

end

get '/' do
	erb "Hello!"
end

get '/NewPost' do
  erb :NewPost
end