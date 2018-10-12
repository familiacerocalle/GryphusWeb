class SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.blocked
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      flash[:alert] = 'Your account is blocked, Please send a request to unblock.'
      respond_with resource, location: unblock_resuest_user_path(resource)
    else
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

end