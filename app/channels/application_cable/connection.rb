module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id] rescue reject_unauthorized_connection
    end
  end
end
