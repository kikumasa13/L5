class ProfilesController < ApplicationController
  before_action :set_login_user

  # 編集画面を表示
  def edit
    @profile = @user.profile || Profile.new
  end

  # 保存（新規登録・更新）
  def update
    @profile = @user.profile || Profile.new
    @profile.message = params[:profile][:message]
    @user.profile = @profile
    if @profile.save
      redirect_to user_path(@user), notice: "プロフィールを保存しました"
    else
      render "edit", status: 422
    end
  end

  # 削除
  def destroy
    @user.profile&.destroy
    redirect_to user_path(@user), notice: "プロフィールを削除しました"
  end

  private

  # ログイン中のユーザを取得（ログインしていなければトップへ戻す）
  def set_login_user
    @user = User.find_by(uid: session[:login_uid])
    redirect_to root_path, alert: "ログインしてください" unless @user
  end
end