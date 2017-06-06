class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
    render json: @poem
    redirect_to poems_path, notice: "ポエム詳細"
  end

end
