class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @usuario = User.find(current_user.id)
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group}}
    end
  end

  def create
    @group = Group.new(group_params)
    @group.user = User.find(current_user.id)
    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path
        else
          flash.now[:error] = 'Error: Group could not be created'
          render :new, locals: { group: @group }
        end
      end
    end
  end

  def show; end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

end