class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    
    @id = params[:id]
    @post = Post.find(@id)
    
    @user = User.find(@post.user_id)
    
    @comments = @post.comments   #해당 포스트에 달려있는 댓글만 가져옴 Comment.all 
  
    
  end
  
  def create
    @title = params[:title]
    @content = params[:content]
        
    Post.create(
        title: @title,
        content: @content,
        user_id: session[:user_id]
    )
        
    Post.all
    redirect_to '/'
  
  end
  
  def destroy
        @id = params[:id]
        @post = Post.find(@id)
        
        @post.destroy

        redirect_to '/'
  end
    
  def modify
        @id = params[:id]
        @post = Post.find(@id)
    
  end

  def update
        @id = params[:id]
        @post = Post.find(@id)
        
        @post.update(
            title: params[:title],
            content: params[:content]
        )
        
        redirect_to "/post/show/#{@id}"

  end
  
  def create_comment
      @comment = params[:comment]
      Comment.create(
        post_id: params[:post_id],
        content: @comment
      )
      redirect_to :back
  end
  
  
end
