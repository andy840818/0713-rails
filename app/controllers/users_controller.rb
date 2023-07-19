class UsersController < ApplicationController
  def new                                                         
    @user = User.new
  end

  def create 
    @user = User.new(user_paramas)
    if @user.save
        redirect_to root_path, notice:"!!勇者生成!!"
    else
        render :new  
    end
  end
  
  def login
  end

  def logining
    # email = params[:user][:email]
    # password = params[:user][:password]
    # password = "x#{password}y".reverse
    # password = Digest::SHA1.hexdigest(password)
    user = User.login(
      params[:user][:email],
      params[:user][:password]
    )
    if user # 發session/cookie
      redirect_to root_path, notice: '我要進來囉'
    else
      redirect_to login_users_path, alert: '失敗的麵'
    end
    # if email.present? and password.present?
    #   user = User.find_by(email: email, password: password)
    #   if user
    #     redirect_to root_path, notice: '登入成功'
    #   else
    #     redirect_to login_users_path, alert: '查無此人'
    #   end
    # else
    #   redirect_to login_users_path, alert: '登入失敗'
    # end
  end

 private
 def user_paramas
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

end
