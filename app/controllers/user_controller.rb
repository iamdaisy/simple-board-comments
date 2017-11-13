class UserController < ApplicationController
  def index
    @users = User.all
  end

  def create
    require 'digest'
    
    @email = params[:email]
    @password = params[:password]
    hidden_pw = Digest::MD5.hexdigest(@password)
    
    User.create(
      email: @email,
      password: hidden_pw
    )
    
    redirect_to '/'
  end
  

  def show
  end  

  def login
  end
  
  def login_process
    require 'digest'
    
    @user_id = params[:user_id]
    @email = params[:email]
    @password = params[:password]
    
    if User.exists?(email: @email)
      @user = User.find_by(email: @email)
      if @user.password == Digest::MD5.hexdigest(@password)
        session[:user_id] = @user.id
        flash[:notice] = "로그인이 성공되었습니다."
        redirect_to '/'
      else
        flash[:notice] = "비밀번호가 틀렸습니다."
        redirect_to '/user/login'
      end
    end
    
  end
  
  
  
  def logout
    
  
    session.clear
    flash[:notice] = "로그아웃 되었습니다."
    redirect_to '/'
  end
  
  
end
