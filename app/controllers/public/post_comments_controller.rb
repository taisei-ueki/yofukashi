class Public::PostCommentsController < ApplicationController
	
	 def create
	   @post = Post.find(params[:post_id])
	   comment = current_user.post_comments.new(post_comment_params)
	   comment.post_id = @post.id
	   if comment.save
	   	redirect_to post_path(@post), notice: 'コメントを投稿しました'
	   else
	   	render :comment
	   end
	 end
	 
	 def destroy
	 	PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
	 	@post = Post.find(params[:post_id])
	 	redirect_to public_post_path(params[:post_id]), alert: 'コメントを削除しました'
	 end
	 
	 private
	 
	 def post_comment_params
	 	params.require(:post_comment).permit(:comment)
	 end
end
