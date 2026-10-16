class TweetsController < ApplicationController
  def create
    user = User.find_by(uid: session[:login_uid])
    return redirect_to root_path unless user

    user.tweets << Tweet.new(message: params[:tweet][:message])
    redirect_to root_path
  end
end