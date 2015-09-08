


class JsonController < ApplicationController
  def display_feed
    @name    =    params[:name]
    @id  = params[:id]
    render "json_feed"
  end
end
