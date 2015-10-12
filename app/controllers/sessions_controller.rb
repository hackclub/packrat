class SessionsController < ApplicationController
  def new
    session['omniauth.user_type'] = params[:user_type]
    redirect_to "/auth/#{params[:provider]}"
  end

  def create
    user = User.where(
      provider: auth_hash.provider,
      uid: auth_hash.uid
    ).first

    if user.nil?
      user_type = session['omniauth.user_type'].to_sym
      session.delete('omniauth.user_type')

      case user_type
      when :club_member
        user = Member.create_from_auth_hash(auth_hash)
      when :club_leader
        user = Leader.create_from_auth_hash(auth_hash)
      else
        render status: :bad_request, text: "Invalid user type: #{user_type}"
      end
    end

    reset_session
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Logged in!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
