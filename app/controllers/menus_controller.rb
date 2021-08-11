class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :show, :destroy]
  def index
    @menus = params[:tag_id].present? ? Tag.find(params[:tag_id]).menu : Menu.all.page(params[:page]).per(6)
    @table = Table.find(params[:table_id])
    @menus = @menus.page(params[:page]).per(6)
  end
  def new
    @menu = Menu.new
  end
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to tables_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @menu.update(menu_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    menu.destroy
  end
  def show
    @menu_order = MenuOrder.new
    @table = Table.find(params[:table_id])
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :price, :image, {:tag_ids=> []})
  end

  def set_menu
    @menu = Menu.find(params[:id])
    @table = Table.find(params[:table_id])
  end
end
