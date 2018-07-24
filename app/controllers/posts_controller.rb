class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def create
    @post = Post.new(content:params[:content], user_id: @current_user.id)
    @post.save

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"

    redirect_to("/posts/index")
  end
    
end
