class Category < ActiveRecord::Base
	has_many :articles,dependent: :destroy

	validates :name ,format:{with:/\A[a-zA-Z|\,|\,|\s]+\z/, message: "Enter letters only"},
	uniqueness:true,presence:true
end
