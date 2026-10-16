class TopController < ApplicationController
  def main
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      redirect_to root_path, alert: "ユーザIDまたはパスワードが違います"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end