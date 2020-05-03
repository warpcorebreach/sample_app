class ApplicationController < ActionController::Base

	def hello
		render 'Hello, Heroku!'
	end
end
