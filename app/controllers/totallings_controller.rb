class TotallingsController < ApplicationController
  before_action :authenticate_user!
  def index
    now = Time.current
    @total_day = MenuOrder.group(:menu_id).where(created_at: now.yesterday.beginning_of_day...now.yesterday.end_of_day).sum(:quantity)
    @total_week = MenuOrder.group(:menu_id).where(created_at: now.beginning_of_week...now.end_of_week).sum(:quantity)
    @total_prev_week = MenuOrder.group(:menu_id).where(created_at: now.prev_week.beginning_of_week...now.prev_week.end_of_week).sum(:quantity)
    @total_month = MenuOrder.group(:menu_id).where(created_at: now.beginning_of_month...now.end_of_month).sum(:quantity)
    @total_prev_month = MenuOrder.group(:menu_id).where(created_at: now.prev_month.beginning_of_month...now.prev_month.end_of_month).sum(:quantity)
    @total_prev_year = MenuOrder.group(:menu_id).where(created_at: now.prev_year.beginning_of_year...now.prev_year.end_of_year).sum(:quantity)
  end
end
