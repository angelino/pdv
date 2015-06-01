class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST users
  def create
    puts params
    user = User.create(user_params)
    render json: user.as_json
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require('user').permit('email', 'password')
  end

end
