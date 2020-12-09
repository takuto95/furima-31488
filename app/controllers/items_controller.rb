class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new(item_params)
  end

private
def item_params
  prams.require(:item).permit(:name,:detail,:item_price,:image).merge(user_id: current_user.id)
end

end
