class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.authenticate(email, password)
    # 特定の管理者のメールアドレスとパスワードの場合のみ認証を許可
    if email == 'admin@example.com' && password == 'passw@rd'
      find_by(email: email)&.authenticate(password)
    else
      nil
    end
  end

  def admin?
    #管理者を判断する基準
    email == 'admin@example.com'
  end

end
