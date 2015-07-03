module SessionsHelper
  def signed_in?
    session[:user_id].present? && User.find_by(id: session[:user_id])
  end
end
