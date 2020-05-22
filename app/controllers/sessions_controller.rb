class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user and user.authenticate(params[:session][:password])
      # log user in and redirect to user's 'show' page
    else
      # error msg
      render 'new'
    end
  end

  def destroy
  end
end
