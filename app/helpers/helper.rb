class Helper
    def logged_in?
        !!session[:user_id]
    end
end