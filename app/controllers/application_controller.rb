class ApplicationController < ActionController::Base
 # 物件導向 - 把大部分會共同用到的方法放進上層
 # 當遇到 ActiveRecord::RecordNotFound 異常時，應該調用 :not_found 方法來進行處理
  rescue_from ActiveRecord::RecordNotFound, with: :not_found #不用符號, 會馬上執行

  private #私有方法, 只能透過公開的方法呼叫私有方法
  def not_found
    #從Rails的根目錄拿取404檔案 , 
    render file: Rails.root.join('public','404.html'), 
          status:404, #為存在的頁面 200 , 加上狀態:表示為不存在的頁面404
          layout: false # 為獨立的頁面 , 不加其他的東西
  end
end

