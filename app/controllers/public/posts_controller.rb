class Public::PostsController < ApplicationController
  
  
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    
  end
  
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to public_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post)
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path(@posts)
  end
  
  def rank
    @favorite_ranks = Post.create_favorite_ranks
    @comment_ranks = Post.create_comment_ranks
  end
  
  def search
    # キーワード検索
    @posts = Post.search(params[:keyword])
    
     # タグ検索
    if params[:jenre_ids]
      @posts = []
      params[:jenre_ids].each do |key, value|      
        @posts += Jenre.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
    end
    
    if params[:place_ids]
      @posts = []
      params[:place_ids].each do |key, value|      
        @posts += Place.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
    end
    
    if params[:category_ids]
      @posts = []
      params[:category_ids].each do |key, value|      
        @posts += Category.find_by(name: key).posts if value == "1"
      end
      @posts.uniq!
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:address,:all_rate,:rush_rate,:relax_rate,:beautiful_rate,jenre_ids: [],place_ids: [],category_ids: [], main_images: [])
  end
  
end
