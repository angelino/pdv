class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  skip_before_filter :verify_authenticity_token, :only => [:options]
  before_filter :authenticate_cors_user
  before_filter :cors_set_access_control_headers

  respond_to :json, :html

  ALLOWED_CLIENTS = {
      # Local
      'localhost:5000' => 'http://localhost:3000',
      # Heroku
      'https://api-lafavoritta-easypos.herokuapp.com' => 'https://lafavoritta-easypos.herokuapp.com/'
  }

  def authenticate_cors_user
    if request.xhr? && !user_signed_in?
      error = { :error => 'You must be logged in.' }
      render :json => error, :status => 401
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = ALLOWED_CLIENTS[env['HTTP_HOST']]
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS, PATCH'
    headers['Access-Control-Allow-Headers'] = '*, X-Requested-With, X-Prototype-Version, X-XSRF-TOKEN, Content-Type'
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def options
    render :json => {data: 'success'}, :status => 200
  end
end
