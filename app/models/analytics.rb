class Analytics
  class_attribute :backend
  self.backend = AnalyticsRuby

  def initialize(user)
    @user = user
  end

  def track_user_creation
    identify
    track(
      {
        user_id: user.id,
        event: 'Create User'
      }
    )
  end

  def track_user_deletion
    track(
      {
        user_id: user.id,
        event: 'Delete User'
      }
    )
  end

  def track_user_sign_in
    identify
    track(
      {
        user_id: user.id,
        event: 'Sign In User'
      }
    )
  end

  def track_user_sign_out
    track(
      {
        user_id: user.id,
        event: 'Sign Out User'
      }
    )
  end

  private

  def identify
    backend.identify(identify_params)
  end

  attr_reader :user

  def identify_params
    {
      user_id: user.id,
      traits: user_traits
    }
  end

  def user_traits
    {
      created_at: user.created_at,
      email: user.email,
      name: user.name,
      phone: user.phone,
      type: user.meta_type
    }
  end

  def track(options)
    backend.track(options)
  end
end
