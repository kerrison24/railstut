include ApplicationHelper

def create_valid_user
  fill_in "Name", with: "Example User"
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

def sign_in_user
  fill_in "Email", with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
