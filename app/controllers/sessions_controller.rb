class SessionsController < ApplicationController
  def new
    session['omniauth.user_type'] = params[:user_type]
    redirect_to "/auth/#{params[:provider]}"
  end

  def create
    user = User.where(
      provider: auth_hash.provider,
      uid: auth_hash.uid
    ).first || User.create_from_auth_hash(auth_hash)

    reset_session
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Logged in!'

    # TODO: Handle different user types
    #
    # user_type = session['omniauth.user_type'].to_sym
    # session.delete('omniauth.user_type')
    #
    # case user_type
    # when :club_member
    # when :club_leader
    # else
    #   render status: :bad_request, text: "Invalid user type: #{user_type}"
    # end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
