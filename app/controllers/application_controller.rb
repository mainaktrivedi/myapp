class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	event = Event.first
  	string s = "Hello World!"
  	s += event.description unless event.nil?
    render html: s
  end

end
