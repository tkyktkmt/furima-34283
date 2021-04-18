class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'include both letters and numbers' }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'please enter in full letters' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: 'please enter in full-width katakana' } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
    validates :birthday
  end
end
