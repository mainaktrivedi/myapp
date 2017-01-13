class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :authenticate_model!

  def hello
  	event = Event.first
  	s = "Hello World <br><br>"
  	s += event.description unless event.nil?
  	#s += link_to "Logout", destroy_model_session_path, :method => :delete
    render html: s
  rescue Exception => e
    render html: e.message  
  end

end
