#work in progress for personal use..
#check event controller in app/controllers for code challenge

module Api::V1
	class EventsController < ApiController

        SHOW_TOP  = 5

		def query
		  if !org.nil?	
			  criteria = Event.includes(host: :org).where(orgs: {id: org.id})
			  criteria = criteria.where(hosts: {id: host.id}) if !host.nil?
			  events = criteria.order(occurred_at: :desc).take(SHOW_TOP)  

			  render json: events, status: 200
		  else
		    render_error "Not Authrized to see all events. Required param not found. You sent #{params[:orgname]} and #{params[:hostname]}", 422	  
		  end
		end

		def index
		  if !org.nil?	
			  criteria = Event.includes(host: :org).where(orgs: {id: org.id})
			  criteria = criteria.where(hosts: {id: host.id}) if !host.nil?
			  events = criteria.order(occurred_at: :desc).take(SHOW_TOP)  

			  render json: events, status: 200
		  else
		    render_error "Not Authrized to see all events. Required param not found. You sent #{params[:orgname]} and #{params[:hostname]}", 422	  
		  end
		end

		def create
			if !host.nil?
			 	event = Event.create(occurred_at: occurred_at, description: description, host: host )
			    render json: event, status: 201
			else
				render_error "Host not found", 400 
			end 
		end
        
        private

        def event_params
        	params.permit(:occurred_at, :description, :hostname, :orgname)
        end

        def host
        	@host ||= Host.where(name: params[:hostname]).first
        end

        def org
        	@org ||= Org.where(name: params[:orgname]).first
        end

        def occurred_at
        	@occurred_at ||= params[:occurred_at]
        end

        def description
        	@description ||= params[:description]
        end

	end
end