class SignInPage < SitePrism::Page

  element :banner, ".applogin-banner"
  element :username, "#okta-signin-username"
  element :password, "#okta-signin-password"
  element :submit_btn, "#okta-signin-submit"


  def sign_in_to_casebook(user_name, pwd)
    username.set user_name
    password.set(pwd)
    submit_btn.click
  end

end