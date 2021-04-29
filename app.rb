require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  @count = Count.find(1).number
  erb :index
end

post '/plus' do
  count = Count.find(1)
  count.number += 1
  count.save
  
  # 以下のようにするとajaxで通信した時、ブラウザが値を受け取れるようになる
  count.number.to_s
end

post '/minus' do
  count = Count.find(1)
  count.number -= 1
  count.save
  
  count.number.to_s
end