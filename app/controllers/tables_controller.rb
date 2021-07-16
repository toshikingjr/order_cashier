class TablesController < ApplicationController
  def index
    @tables = Table.includes(:order_confirms)
  end
  def new
    @table = Table.new
  end
  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path
    else
      render :new
    end
  end
  def show
    @table = Table.find(params[:id])
    @menu_orders = MenuOrder.where(order_id: @table.order_confirms.map(&:order_id))
  end
  def destroy
    @table = Table.find(params[:id])
    if @table.destroy
      redirect_to :index
    else
      render :show
    end
  end

  private

  def table_params
    params.require(:table).permit(:table_num)
  end

end
