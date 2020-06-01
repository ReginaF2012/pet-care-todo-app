class Helper
    def self.logged_in?
        !!session[:user_id]
    end
end