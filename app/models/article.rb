class Article < ActiveRecord::Base
	has_many :comments,dependent: :destroy
	belongs_to :category
	belongs_to :user
	has_many :likes, as: :likable
    mount_uploader :image, ImageUploader

	validates :text,:title,presence:true,:uniqueness => true
	validates :title,format:{with:/\A[a-zA-Z|0-9|\,|\,|\s]+\z/, message: "Enter letters only"}
	validates :text,format:{with:/\A[a-zA-Z|0-9|\s|\,|\.|\-]+\z/, message: "Enter text in correct format"}
	validates :image,presence:true

end
