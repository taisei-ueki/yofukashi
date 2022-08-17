class Public::PostCommentsController < ApplicationController
	
	 def create
	   @post = Post.find(params[:post_id])
	   @post_comment = current_user.post_comments.new(post_comment_params)
	   @post_comment.post_id = @post.id
	   if @post_comment.save
	   	flash.now[:notice] = 'コメントを投稿しました'
	   	render :post_comment
	   else
	   	render 'pubilc/post/show'
	   end
	 end
	 
	 def destroy
	 	PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
	 	flash.now[:alert] = '投稿を削除しました'
	 	@post = Post.find(params[:post_id])
	 	render :post_comment
	 end
	 
	 private
	 
	 def post_comment_params
	 	params.permit(:comment)
	 end
end
