# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    @restaurants = build_restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def build_restaurant_search
    results = if params[:search].present?
                SearchYelp.create(params[:search], current_location)
              else
                SearchYelp.create('Pizza', current_location)
              end
    results['businesses']
  end

  def build_restaurants
    build_restaurant_search.map do |r|
      Restaurant.find_or_create_by(name: r['name'],
                                   description: r['categories'].map { |h| h['title'] }.join(', '),
                                   address_one: r['location']['address1'],
                                   address_two: if r['location']['address2'].present?
                                                  r['location']['address2']
                                                end,
                                   city: r['location']['city'],
                                   state: r['location']['state'],
                                   country: r['location']['country'],
                                   zip_code: r['location']['zip_code'],
                                   latitude: r['coordinates']['latitude'],
                                   longitude: r['coordinates']['longitude'],
                                   phone: r['display_phone'],
                                   rating: r['rating'],
                                   image_url: r['image_url'])
    end
  end

  def current_location
    lat = user_current_lat
    lon = user_current_lon
    result = Geocoder.search([lat, lon]).first
    city = result.city
    state = result.state
    country = result.country

    [city, state, country].compact.join(', ')
  end

  def user_current_lat
    if Rails.env.production?
      request.location.latitude
    else
      '38.89511' # NOTE: Current location latitude
    end
  end

  def user_current_lon
    if Rails.env.production?
      request.location.longitude
    else
      '-77.03637' # NOTE: Current location longitude
    end
  end
end
