class Foodbank

  attr_reader :name, 
            :rating, 
            :address, 
            :link, 
            :street, 
            :city, 
            :postalcode,
            :id,
            :mission,
            :snippet,
            :state


  def initialize(foodbank)
    @name = foodbank[:charityName]
    @snippet = foodbank[:tagLine]
    @rating = foodbank[:currentRating][:score]
    @link = foodbank[:websiteURL]
    @state = foodbank[:mailingAddress][:stateOrProvince]
    @street = foodbank[:mailingAddress][:streetAddress1]
    @city = foodbank[:mailingAddress][:city]
    @postalcode = foodbank[:mailingAddress][:postalCode]
    @id = foodbank[:ein]
    @mission = foodbank[:mission]
  end

end
