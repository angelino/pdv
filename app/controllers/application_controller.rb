class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :json_request?

  before_action :authenticate_user!

  before_action :authenticate_cors_user
  before_action :cors_set_access_control_headers
  skip_before_action :verify_authenticity_token, :only => [:options]
  skip_before_action :authenticate_user!, :only => [:options]

  respond_to :json

  def options
    render :json => {data: 'success'}, :status => 200
  end

  protected

  ALLOWED_CLIENTS = {
      # Local
      'localhost:5000' => 'http://127.0.0.1:3000',
      # Heroku
      'api-lafavoritta-easypos.herokuapp.com' => 'https://lafavoritta-easypos.herokuapp.com'
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

  def json_request?
    request.format.json?
  end
end