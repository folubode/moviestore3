class RolesController < ApplicationController
  def new
    @role = Role.new
  end

  def create
    Role.create role_params
    redirect_to users_path
  end

  def change_role
    @user = User.find params[:id]
    @role = Role.find params[:role]
    @user.update_attributes role: @role
    render json: { user_id: @user.id, role_id: @role.id, status: 'ok' }
  end

  private
  def role_params
    params.require(:role).permit(:name, :creating, :updating, :deleting, :commenting, :user_control, :buying)
  end
end
