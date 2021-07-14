class TablesController < ApplicationController
  def index
    @tables = Table.all
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
  end

  private

  def table_params
    params.require(:table).permit(:table_num)
  end

end
