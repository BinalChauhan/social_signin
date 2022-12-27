class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    authenticate
  end

  def facebook
    authenticate
  end

  # def linkedin
  #   authenticate
  # end

  def authenticate
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Linkedin"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      # session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to new_account_session_url
    end
  end
end