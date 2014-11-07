module SessionsHelper
    
    def current_user
        if !session[:user_id].blank?
        current_user = User.find(session[:user_id])
        else
        current_user = nil
        end
        
        return current_user
    end
    
    def current_user_logged_in?
        if current_user
         true
        else
         false
        end
    end
    
end
