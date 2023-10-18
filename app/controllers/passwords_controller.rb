class PasswordsController < Devise::PasswordsController
  def update
    super
  rescue ActiveRecord::RecordInvalid => e
    self.resource = e.record
    self.resource.reset_password_token = resource_params[:reset_password_token]
    respond_with self.resource
  end
end
