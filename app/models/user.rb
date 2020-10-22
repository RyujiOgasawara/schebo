class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 新規ユーザー登録を無効にするためregisterableを削除
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
