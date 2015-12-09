class PasswordsController < Devise::RegistrationsController
    before_filter :authenticate_user!
    def edit
        @num_of_cars = current_user.num_of_cars.all
        super
    end
    
    def update
        @user = current_user
        # raise params.inspect
        if @user.update_with_password(params[:user])
            sign_in(@user, :bypass => true)
            redirect_to user_path, :notice => "Password has been change!"
            else
            render :edit,:locals => { :resource => @user, :resource_name => "user" }
        end
    end
end