class YelpApi


  def self.client

    @client ||= Yelp::Client.new(
    {consumer_key: '5SIRlyrUcMWFR8BzUNSIgg',
    consumer_secret: 'BA7kYx7eLNiZ8nvK9zll13p3ntQ',
    token:'3ETejs4g6b_teSYqw2bmhKlR6u6T8pmx',
    token_secret: '-7OxcGYadNfe5Ptu2NEXFqrRqf4'})
  end

  def self.search(location, cuisine='food')

  results = client.search(location, {term: cuisine})
  results.businesses.map do |result|
    Business.find_or_create_by(name:result.name, address:result.location.display_address, rating:result.rating, yelp_id:result.id, phone:result.phone, review_count:result.review_count, url:result.url)
    end
  end



end
