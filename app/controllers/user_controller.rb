class UserController < ApplicationController
    def index
        @users = User.all  #一覧表示
        @user = User.new   #フォーム用
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path,notice:"ユーザー登録が完了しました"
        else
            flash.now[:alert] = "ユーザー登録に失敗しました"
            render :index
        end
    end

    private

    def user_params. # Strong Parameters
        # paramsから: userキーの値を取得し、許可された属性のみを指定
        # :name, :email, :password, :password_confirmationを許可
        # これにより、セキュリティを強化し、意図しない属性の変更を防ぐ
        user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end