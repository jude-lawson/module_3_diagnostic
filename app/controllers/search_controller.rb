class SearchController < ApplicationController
  def index
    create_presenter(searcher: SearchResults.new(zip_code: params[:q]))
  end
end
