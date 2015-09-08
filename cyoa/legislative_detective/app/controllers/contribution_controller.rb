require_relative'../helpers/json_parsing_helper'
require_relative '../../lib/api_cache'
require_relative '../../lib/request_configuration'


class ContributionController < ApplicationController
  include JsonParsingHelper
  NUM_RESULTS = 10
  def find_contribution

    options = {
        :amount => 1000,
        :cycle => 2014,
        :recipient_ft => params[:name],
        :per_page => NUM_RESULTS,
        :apikey => APP_CONFIG['api_key']


    }


    @name    =   params[:name]
    @id  = params[:id]
    config   =  RequestConfiguration.new("transparencydata.com", "api/1.0/contributions.json?")
    data_campaign_contribution = ApiCache.fetch_json_with_cache(options,config,120.hour)
    @campaign_contribution  =  parse_json(data_campaign_contribution)
  end


end