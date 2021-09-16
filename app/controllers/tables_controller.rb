class TablesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :calling]
  def index
    @tables = Table.group('table_num').from(Table.order(id: :desc), :tables)
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
      redirect_to tables_path
    else
      render :show
    end
  end

  def calling
    @table = Table.find(params[:id])
    
  end

  private

  def table_params
    params.require(:table).permit(:table_num)
  end

end
