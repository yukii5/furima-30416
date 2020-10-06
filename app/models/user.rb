class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  with_options presence: true do
   

  validates :nickname

  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' }

  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' }

  validates :family_name_furikana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力して下さい' } 

  validates :first_name_furikana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: 'は全角カタカナのみで入力して下 さい' } 

  end
  validates :birthday,               presence: true

  has_many :items
  has_many :comments
  has_many :orders
end
