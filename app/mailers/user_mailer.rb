class UserMailer < ApplicationMailer

	def welcome_user(email)
		@email = email
		attachments["images.jpg"] = File.read("#{Rails.root}/app/assets/images/images.jpg")
		 # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
		mail(to: @email, subject:'Welcome to my mail')
	end

	def like_user(email,article)
		@email = email
		@article = article
		mail(to: @email, subject:'Welcome to my mail')
	end
end
