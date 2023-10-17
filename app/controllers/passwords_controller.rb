class PasswordsController < Devise::PasswordsController
  def update
    super
  rescue ActiveRecord::RecordInvalid => e
    self.resource = e.record
    respond_with self.resource
  end
end
