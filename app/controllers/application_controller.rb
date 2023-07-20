class ApplicationController < ActionController::Base
 # 物件導向 - 把大部分會共同用到的方法放進上層
 # 當遇到 ActiveRecord::RecordNotFound 異常時，應該調用 :not_found 方法來進行處理
  rescue_from ActiveRecord::RecordNotFound, with: :not_found #不用符號, 會馬上執行
  
  #Controller 很常用所以直接導入上層control
  helper_method :user_signed_in?, :current_user



  private #私有方法, 只能透過公開的方法呼叫私有方法

  def user_signed_in?
    session[:user].present?
  end

 def current_user #抓一個user出來
  if user_signed_in?
    #記憶 把抓出來的東西塞進實體變數
    @__user__ ||= User.find_by(id: session[:user])
  else
    nil
  end
end

 def authenticated_user!
  if not user_signed_in? #判斷有無登入
       redirect_to login_users_path, notice: "沒登入不要吵!"
  end
 end

  def not_found
    #從Rails的根目錄拿取404檔案 , 
    render file: Rails.root.join('public','404.html'), 
          status:404, #為存在的頁面 200 , 加上狀態:表示為不存在的頁面404
          layout: false # 為獨立的頁面 , 不加其他的東西
  end
end

