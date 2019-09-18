class VeteransController < ApplicationController

  def index
    @styles = Style.where(id: params[:styles])
    @gym = Gym.find params[:gym]
    @trainers = User.veteran.with_styles(@styles).at_gym(@gym).uniq
  end

  private

  def trainers
    @styles.each do |style|
      trainer = Style.find(style)
      @trainers << trainer.users.where(gym_id: params[:gym])
    end
  end

end


