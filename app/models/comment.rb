class Comment < ActiveRecord::Base
	belongs_to :article
	has_many :likes, as: :likable

	validates :commenter,:body,presence:true,format:{with: /\A[a-zA-Z|\.|\s|\,]+\z/,message: "Enter valid sentences"}
end
