module Api::V1

  class ApiController < ::ApplicationController

    before_action	:authenticate_api

    respond_to? :json

    protected
    def authenticate_api
      true
    end

    def render_error(errors, status = 422)
    	render json: {errors: Array(errors) }.to_json, status: status
    end
  end

end
