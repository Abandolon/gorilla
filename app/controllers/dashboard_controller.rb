class DashboardController < ApplicationController
  def show
    # if current_user.present?
      @user = current_user
  end
end
