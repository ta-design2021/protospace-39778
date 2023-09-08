class PrototypesController < ApplicationController

  def index
    # indexアクションに、インスタンス変数@prototypesを定義し、すべてのプロトタイプの情報を代入
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params) # 新しいプロトタイプオブジェクトを作成し、フォームデータを関連付けます
    if @prototype.save
      redirect_to root_path
    else
      # N+1問題の解消のための記述
      # この記述が必要か、また書き方があっているかよう確認
      @prototypes = Prototype.includes(:prototypes)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
