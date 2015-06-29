class SessionController < ApplicationController
  def login
    if request.post?
      if user = User.find_by_email(params[:email])
        if user.authenticate(params[:password])
          session[:uid] = user.uid
          redirect_to tasks_path, notice: "successfully logged in"
        else
          flash.now[:notice] = "incorrect credentials"
        end
      else
        flash.now[:notice] = "incorrect credentials"
      end
    end
  end

  def logout
    session[:uid] = nil
    redirect_to session_login_path, notice: "logged out"
  end
end
