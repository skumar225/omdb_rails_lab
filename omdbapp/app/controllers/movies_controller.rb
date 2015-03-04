class MoviesController < ApplicationController
  def index
    
  end

  

def searchmovie
  @movieresult = []
   @movie = params[:movies]
   request = Typhoeus::Request.new(
     "http://www.omdbapi.com/?",
       method: :get,
       params: {s: @movie}
       )
   request.run
   result = request.response.body   #Storing request in a result
   @movieresult = JSON.parse(result)   #Parse the result to get result out of the string format
   @movieresult = @movieresult["Search"]   #Extracting out the result from the hash within the hash, with key value pair of search
   respond_to do |format|
   format.html # render .erb template as normal
   format.json {render :json => @movieresult}
    end
end
end



