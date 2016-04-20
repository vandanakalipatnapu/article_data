class UserMailer < ApplicationMailer

	def welcome_user(email)
		@email=email
		mail(to: @email, subject:'Welcome to my mail')
	end

	def like_user(email)
		@email=email
		mail(to: @email, subject:'Welcome to my mail')
	end
end
