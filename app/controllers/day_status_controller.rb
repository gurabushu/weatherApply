class DayStatusController < ApplicationController

    def index
        @day_statuses = DayStatus.all  #一覧表示
        @day_status = DayStatus.new   #フォーム用
    end

    def create
        @day_status = DayStatus.new(day_status_params)
        if @day_status.save
            redirect_to root_path, notice: "日付ステータスの登録が完了しました"
        else
            flash.now[:alert] = "日付ステータスの登録に失敗しました"
            render :index
        end
    end

    private
    def day_status_params
        params.require(:day_status).permit(:date, :status, :user_id)
        # paramsから: day_statusキーの値を取得し、許可された属性のみ
        # :date, :status, :user_idを許可
        # これにより、セキュリティを強化し、意図しない属性の変更を防ぐことができる
    end
end