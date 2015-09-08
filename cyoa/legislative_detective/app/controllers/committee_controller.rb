require_relative'../helpers/json_parsing_helper'
require_relative '../../lib/api_cache'
require_relative '../../lib/request_configuration'


class CommitteeController < ApplicationController
  include JsonParsingHelper
  NUM_RESULTS = 10
  def find_committee

    options = {
        :member_ids => params[:id],
        :per_page => NUM_RESULTS,
        :apikey => APP_CONFIG['api_key']
    }
    @name    =    params[:name]
    @id  = params[:id]
    config   =  RequestConfiguration.new("congress.api.sunlightfoundation.com", "committees?")

    data_committee = ApiCache.fetch_json_with_cache(options,config,120.hour)

    @committee  =  parse_json(data_committee)

  end


end