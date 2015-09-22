class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @club_member = ClubMember.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @club_member
  end
end
