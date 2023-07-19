class User < ApplicationRecord

  validates :password , confirmation: true #檢查確認密碼 有無相同
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { 
                      with: URI::MailTo::EMAIL_REGEXP, 
                      message: '格式有誤' 
                    }
  before_create :encrypt_password 

 def self.login(email, password)
  return nil if email.empty? or password.empty?
  
  password = "x#{password}y".reverse
  password = Digest::SHA1.hexdigest(password)

  # find_by email:, password:
  User.find_by(email: email, password: password)
 end 

  private
  def encrypt_password
    pw = "x#{self.password}y".reverse
    self.password = Digest::SHA1.hexdigest(pw) 
  end                
end