class StylesController < ApplicationController

  def index
    @styles = Style.all
    @veterans = User.veteran
    @user = User.all
  end
end
