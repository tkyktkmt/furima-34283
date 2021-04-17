class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'please enter in full letters' } do
    validates :first_name
    validates :last_name
  end
  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'include both letters and numbers' }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'please enter in full-width katakana' }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'please enter in full-width katakana' }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'please enter in full-width katakana' }
  validates :birthday, presence: true
end
