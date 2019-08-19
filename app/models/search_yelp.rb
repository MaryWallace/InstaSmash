# frozen_string_literal: true

class SearchYelp
  def self.create(term, location)
    url = 'https://api.yelp.com/v3/businesses/search'
    params = {
      term: term,
      location: location,
      limit: 12
    }
    response = HTTP.auth("Bearer #{ENV['YELP_API']}").get(url, params: params)
    response.parse
  end
end
