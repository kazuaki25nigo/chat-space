class MessagesController < ApplicationController
  # private以下にset_groupを定義し、
  # before_actionを利用して呼び出すことで、
  # messagesコントローラの全てのアクションで@groupを利用できるようになります。
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end
  # indexアクションでは、Messageモデルの新しいインスタンスである@message、グループに所属する全てのメッセージである@messagesを定義しています。
  # 「n + 1 問題」を避けるために、includes(:user)の記述を忘れずに行いましょう。



  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
    # createアクションでは、グループ作成機能を実装した際と同様に、
    # 保存に成功した場合、保存に失敗した場合で処理を分岐させましょう。
  
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
# 今回実装したい機能は以下の2つです。
#   メッセージの一覧を表示させたい
#   メッセージを追加したい
# それぞれの機能に該当するアクションは、indexとcreateです。
end
