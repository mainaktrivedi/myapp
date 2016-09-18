
	class EventsController < ApplicationController

        SHOW_TOP  = 5

        
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

		# this is another implementation.. check routes
		#http://localhost:3000/events/query/org/Org1
		#http://localhost:3000/events/query/org/Org1/host/Host1ForOrg1
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



		def create
			if !host.nil?
			 	event = Event.create(occurred_at: occurred_at, description: description, host: host )
			    render json: event, status: 201
			else
				render_error "Host not found", 422
			end 
		end
        
        private

        def render_error(errors, status = 422)
    		render json: {errors: Array(errors) }.to_json, status: status
    	end
    	
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