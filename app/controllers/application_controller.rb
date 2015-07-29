class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :valid_cookies_sent?
  skip_before_action :verify_authenticity_token, :only => [:options]

  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, :only => [:options]

  before_action :cors_set_access_control_headers

  respond_to :json

  def options
    render :json => {data: 'success'}, :status => 200
  end

  rescue_from Exception do |exception|
    render :json => {errors:{message: exception.to_s}}, :status => 500
  end

  protected

  ALLOWED_CLIENTS = {
      # Local
      'localhost:5000' => 'http://127.0.0.1:3000',
      # Heroku
      'api-lafavoritta-easypos.herokuapp.com' => 'https://lafavoritta-easypos.herokuapp.com'
  }

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = ALLOWED_CLIENTS[env['HTTP_HOST']]
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS, PATCH'
    headers['Access-Control-Allow-Headers'] = '*, X-Requested-With, X-Prototype-Version, Content-Type'
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def valid_cookies_sent?
    valid_authenticity_token?(session, cookies['XSRF-TOKEN'])
  end
end
