class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' }

  validates :first_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' }

  validates :family_name_furikana, presence: true,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力して下さい' } 

  validates :first_name_furikana, presence: true,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: 'は全角カタカナのみで入力して下 さい' } 

  validates :birthday,               presence: true

  has_many :items
  has_many :comments
  has_many :orders
end
