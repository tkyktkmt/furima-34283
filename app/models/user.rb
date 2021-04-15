class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  validates :encrypted_password, presence: true, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Password Include both letters and numbers"}
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/ }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/ }
  validates :birthday, presence: true
 
end
