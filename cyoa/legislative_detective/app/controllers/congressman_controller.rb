require_relative'../helpers/json_parsing_helper'
require_relative '../../lib/request_configuration'
require_relative '../../lib/api_cache'


class CongressmanController < ApplicationController
     include JsonParsingHelper
     NUM_RESULTS = 10
     def find_congressman
      options = {
          :zip => params[:zipcode],
          :per_page => NUM_RESULTS,
          :apikey => APP_CONFIG['api_key']

      }

    config   =  RequestConfiguration.new('congress.api.sunlightfoundation.com','legislators/locate?')
    data_congressman = ApiCache.fetch_json_with_cache(options,config,120.hour)
    @congressman =  parse_json(data_congressman)

  end
  

end
