class CommentsController < ApplicationController
 def create
  # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
  @comment = current_user.comments.build(comment_params)
  @blog = @comment.blog
  # クライアント要求に応じてフォーマットを変更
   respond_to do |format|
    if @comment.save
      format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
    else
      format.html { render :new }
    end
   end
 end

  private
   # ストロングパラメーター
   def comment_params
     params.require(:comment).permit(:blog_id, :content)
   end
end
