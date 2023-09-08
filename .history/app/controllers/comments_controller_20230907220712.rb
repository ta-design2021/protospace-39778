class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      # コメントと結びつく投稿の詳細画面に遷移する
      redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      # 保存ができなかった場合は詳細ページに戻る
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
