require_relative'../helpers/json_parsing_helper'
require_relative '../../lib/api_cache'
require_relative '../../lib/request_configuration'


class NumBillsController < ApplicationController

  @num_of_bills = {}
  include JsonParsingHelper
  NUM_RESULTS = 10
  def find_numbills
    @name    =   params[:name]
    @id  = params[:id]
    config   =  RequestConfiguration.new("congress.api.sunlightfoundation.com","bills?")
    ids = session["id"]
      options = {
          :sponsor_id => ids,
          :per_page => NUM_RESULTS,
          :apikey => APP_CONFIG['api_key'],
      }
    numBills = NumBills.new
    @num_of_bills = numBills.calc_bills(options,config,120.hour,ids)
  end
end
