require_relative'../helpers/json_parsing_helper'
require_relative '../../lib/api_cache'
require_relative '../../lib/request_configuration'
require 'pry'

class BillController < ApplicationController
  include JsonParsingHelper
  NUM_RESULTS = 10

  def find_bill
    @name    =   params[:name]
    @id  = params[:id]
    options = {
        :sponsor_id => params[:id],
        :per_page => NUM_RESULTS,
        :apikey => APP_CONFIG['api_key'],


    }
    

    config   =  RequestConfiguration.new("congress.api.sunlightfoundation.com","bills?")
    data_bill = ApiCache.fetch_json_with_cache(options,config,120.hour)
    @bill=  parse_json(data_bill)
    retrieve_tagged_bills
  end

  def display_search_bill
    @name    =   params[:name]
    @id  = params[:id]
    @taggedbill
    render "display_search_results.html.erb"
  end

  def display_search_results
    @name    =   params[:name]
    @id  = params[:id]
    search   = params[:searchbill]
    search = search.strip
    raise 'Your search tag has an invalid value' if search =~ /^\d{4}$/
    search_tags     =  search.split(',')
    #@taggedbill = TaggedBill.where(:tags => search_tags).first
    taggedbill = TaggedBill.find_by_sql("SELECT * FROM tagged_bills
    WHERE
  ORDER BY clients.created_at desc")
  end


  def insert_tagged_bill
    taggedbill  = TaggedBill.new
    taggedbill.bill_desc = params[:title]
    taggedbill.tags    = params[:tags]
    taggedbill.date_introduced = params[:introduced_on]
    taggedbill.date_issued = params[:date_issued]
    taggedbill.chamber = params[:chamber]
    taggedbill.save
    find_bill
    render "find_bill.html.erb"
  end

  def retrieve_tagged_bills
    @taggbills  = TaggedBill.all
  end

end
