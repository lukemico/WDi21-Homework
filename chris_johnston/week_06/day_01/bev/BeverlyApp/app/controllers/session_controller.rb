class SessionController < ApplicationController
def new
end

def create
    email = params["email"]
    password = params["password"]
    firstname = params["firstname"]
    secondname = params["secondname"]
    user = User.find_by(email: email)
  if user.present? && user.authenticate(password)
    session[:user_id] = user.id
    redirect_to "/users"
  else
    flash[:login_error] = "The password or email was incorrect"
  end
end

def destroy
    session[:user_id] = nil
    redirect_to "/users"

end
end
