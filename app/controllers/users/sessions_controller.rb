class Users::SessionsController < Devise::SessionsController
  responde_to :json

  private
  def responde_with(_resource, _opts = {})
    render json: {
      message: "Signed up sucessfully.",
      user: current_user
    }, status: :ok
  end

  def responde_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened." }, status: :unauthorized
  end
end