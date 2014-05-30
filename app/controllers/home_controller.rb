class HomeController < ApplicationController
  def landing
  end

  def login
    user = User.find_by(email: email)
    current_user = user.authenticate(password)
  end
end
