class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos #accepts_nested_attributes_forは、親子関係のある関連モデル(今回でいうとPostモデルとPhotoモデル）で、親から子を作成したり保存するときに使える。今回投稿する際にPostモデルの子に値するPhotoモデルを通して、photosテーブルに写真を保存します。accepts_nested_attributes_forメソッドを親のモデル（Postモデル）に追加する必要がある。
end
