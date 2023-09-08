class PrototypesController < ApplicationController
  # before_action :set_prototype, only: [:edit, :show]

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

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to prototype_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # def set_prototype

  # end

end
