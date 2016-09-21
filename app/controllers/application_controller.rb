class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	event = Event.first
  	s = "Hello World!"
  	s += event.description unless event.nil?
    render html: s
  rescue Exception => e
    render html: e.message  
  end

end
