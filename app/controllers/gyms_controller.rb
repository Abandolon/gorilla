class GymsController < ApplicationController
  def index
    @gyms = Gym.where.not(latitude: nil, longitude: nil)
    @markers = @gyms.map do |gym|
      {
        lng: gym.longitude,
        lat: gym.latitude,
        image_url: helpers.asset_url(gym.photo),
        infoWindow: render_to_string(partial: "infowindow", locals: { gym: gym })
      }
    end
    @gyms_names = []
    @gyms.each do |gym|
      @gyms_names << gym.name
    end
    @gyms_names
  end
end
