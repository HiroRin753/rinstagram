class User < ApplicationRecord
  has_many :posts, dependent: :destroy #dependent: :destroyをつけることで、オブジェクトが削除されるときに、関連付けられたオブジェクトのdestroyメソッドが実行される。今回で言うと、ユーザーが削除されたら、そのユーザーに紐づく投稿も削除される。
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,presence:true,length:{maximum:50}

  def update_without_current_password(params, *options) #パスワードを入力しなくてもプロフの編集が可能

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
