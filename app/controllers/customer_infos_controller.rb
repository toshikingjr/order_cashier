class CustomerInfosController < ApplicationController
  before_action :already_exist, except: :index
  before_action :authenticate_user!, only: :index

  def index
    now = Time.current
    @all_count_month = CustomerInfo.where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).count
    @count_men_month = CustomerInfo.group(:age_id).where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).count
    @count_women_month = CustomerInfo.group(:age_id).where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).count
    @all_count_3_month = CustomerInfo.where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).count
    @count_men_3_month = CustomerInfo.group(:age_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).count
    @count_women_3_month = CustomerInfo.group(:age_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).count
    @all_count_prev_year = CustomerInfo.where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).count
    @count_men_prev_year = CustomerInfo.group(:age_id).where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).where(sex_id: 2).count
    @count_women_prev_year = CustomerInfo.group(:age_id).where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).where(sex_id: 3).count

    @count_menu_men_10s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 2).sum(:quantity)
    @count_menu_women_10s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 2).sum(:quantity)
    @count_menu_men_early_20s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 3).sum(:quantity)
    @count_menu_women_early_20s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 3).sum(:quantity)
    @count_menu_men_late_20s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 4).sum(:quantity)
    @count_menu_women_late_20s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 4).sum(:quantity)
    @count_menu_men_early_30s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 5).sum(:quantity)
    @count_menu_women_early_30s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 5).sum(:quantity)
    @count_menu_men_late_30s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 6).sum(:quantity)
    @count_menu_women_late_30s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 6).sum(:quantity)
    @count_menu_men_early_40s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 7).sum(:quantity)
    @count_menu_women_early_40s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 7).sum(:quantity)
    @count_menu_men_late_40s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 8).sum(:quantity)
    @count_menu_women_late_40s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 8).sum(:quantity)
    @count_menu_men_early_50s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 9).sum(:quantity)
    @count_menu_women_early_50s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 9).sum(:quantity)
    @count_menu_men_late_50s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 10).sum(:quantity)
    @count_menu_women_late_50s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 10).sum(:quantity)
    @count_menu_men_early_60s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 11).sum(:quantity)
    @count_menu_women_early_60s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 11).sum(:quantity)
    @count_menu_men_late_60s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 12).sum(:quantity)
    @count_menu_women_late_60s = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 12).sum(:quantity)
    @count_menu_men_70s_and_over = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 2).where(age_id: 13).sum(:quantity)
    @count_menu_women_70s_and_over = MenuOrder.group(:menu_id).where(created_at: now.ago(4.month).beginning_of_month...now.prev_month.end_of_month).where(sex_id: 3).where(age_id: 13).sum(:quantity)
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
