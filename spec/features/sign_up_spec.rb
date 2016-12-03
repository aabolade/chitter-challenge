require_relative 'web_helpers'

feature "Signing up" do
  scenario "Signing up for Chitter increases the user count by 1" do
    expect{sign_up}.to change{User.count}.by 1
  end

   scenario "User has to sign up with an unique username and email" do
     sign_up
     expect{sign_up}.to change{User.count}.by 0
   end

   scenario "A must sign up with a valid email address" do
     expect{invalid_email_sign_up}.to change{User.count}.by 0
   end
end
