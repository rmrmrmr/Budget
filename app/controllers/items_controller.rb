class ItemsController < ApplicationController
  def new
    @item = Item.new
    respond_to do |format|
      format.html { render :new, locals: { item: @item } }
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = User.find(current_user.id)
    @item.group = Group.find(params[:group_id])
    respond_to do |format|
      format.html do
        if @item.save
          redirect_to  group_path(params[:group_id])
        else
          flash.now[:error] = "Error: Item could not be saved"
          render :new, locals: { item: @item }
        end
      end
    end
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
