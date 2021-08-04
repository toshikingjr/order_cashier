class CustomerInfosController < ApplicationController
  before_action :already_exist, except: :index
  before_action :authenticate_user!, only: :index

  def index
    now = Time.current
    @all_count_month = CustomerInfo.where(created_at: now.beginning_of_month...now.end_of_month).count
    @count_men_month = CustomerInfo.group(:age_id).where(created_at: now.beginning_of_month...now.end_of_month).where(sex_id: 2).count
    @count_women_month = CustomerInfo.group(:age_id).where(created_at: now.beginning_of_month...now.end_of_month).where(sex_id: 3).count
    @all_count_prev_month = CustomerInfo.where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).count
    @count_men_prev_month = CustomerInfo.group(:age_id).where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).count
    @count_women_prev_month = CustomerInfo.group(:age_id).where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).count
    @count_men_prev_year = CustomerInfo.group(:age_id).where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).where(sex_id: 2).count
    @count_women_prev_year = CustomerInfo.group(:age_id).where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).where(sex_id: 3).count
  end

  def new
    @customer_info = CustomerInfo.new
    @table = Table.find(params[:table_id])
  end

  def create
    @customer_info = CustomerInfo.new(customer_info_params)
    @table = Table.find(params[:table_id])
    if @customer_info.save
      redirect_to table_menus_path(@table.id)
    else
      render :new
    end
  end

  private

  def customer_info_params
    params.require(:customer_info).permit(:sex_id, :age_id).merge(table_id: params[:table_id])
  end

  def already_exist
    table = Table.find(params[:table_id])
    customer_info = CustomerInfo.where(table_id: table.id)
    if customer_info != nil
      redirect_to table_menus_path(table.id)
    end
  end
end
