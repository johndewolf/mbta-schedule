Bundler.require :web
Bundler.require :development if development?
require 'sinatra'
require 'csv'
require 'json'
require 'httparty'

configure do
  set :root, File.dirname(__FILE__)
end

get '/' do
	response = CSV.new(HTTParty.get('http://developer.mbta.com/lib/gtrtfs/Departures.csv').body, :headers => true, :header_converters => :symbol, :converters => :all)
	@tripData = response.to_a.map {|row|
		row[0] = DateTime.strptime(getDate(row[0]), "%s").strftime("%H:%M:%S EST")
		row[4] = DateTime.strptime(getDate(row[4]), "%s").strftime("%H:%M:%S EST")
		if row[5] > 0
			row[5] = (row[5] / 60).to_s
		end
		row.to_hash
	}
  erb :index
end

not_found do
  erb :'404'
end

helpers do 
	def getDate(num)
		(num - 14400).to_s
	end
end