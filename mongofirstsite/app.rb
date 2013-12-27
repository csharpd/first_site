require 'sinatra'
require 'mongoid'
require 'json'

## Mongoid setup
## =============

Mongoid.load!("mongoid.yml", :development)

class Recipe
    include Mongoid::Document

    field :name
    field :description
    field :ingredients
    field :tag
    field :contributor 
end

## Sinatra app
## ===========

# display signup form
get '/' do
    erb :form
end

# add new user, display thanks
post '/' do
    name = params[:name]
    description = params[:description]
    ingredients = params[:ingredients]
    tag = params[:tag]
    contributor = params[:contributor]
    @recipe = Recipe.new(:name => name, :description => description, :ingredients => ingredients, :tag => tag, :contributor => contributor, )
    @recipe.save
    erb :thanks
end

# show all the users so far
get '/list' do
    @recipes = Recipe.all
    erb :list
end