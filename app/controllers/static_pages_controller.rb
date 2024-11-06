class StaticPagesController < ApplicationController
  def index
    @flickr_id = params[:id]
    puts ""
    puts @flickr_id
    puts ""

    if @flickr_id
      api_query_string = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV["FLICKR_API_KEY"]}&user_id=#{@flickr_id}&format=json&nojsoncallback=1"

      conn = Faraday.new(api_query_string) do |f|
        f.response :json
      end

      data = conn.get("json").body
      @photos = data["photos"]["photo"]
    end
  end
end
