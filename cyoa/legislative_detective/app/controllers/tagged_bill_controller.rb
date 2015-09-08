require 'pry'

class TaggedBillController < ApplicationController
  include JsonParsingHelper
  NUM_RESULTS = 10

  def insert_tagged_bill
    taggedbill  = TaggedBill.new
    taggedbill.bill_name = params[:title]
    taggedbill.tags    = params[:tags]
    taggedbill.introduced_on = params[:introduced_on]
    taggedbill.last_version = params[:last_version]
    taggedbill.chamber = params[:chamber]
    taggedbill.save
    retrieve_tagged_bills
    render "bill/find_bill.html.erb"
  end

  def retrieve_tagged_bills
    @taggbills  = TaggedBill.all
    find_bills
  end

  def find_bills

    options = {
        :sponsor_id => params[:id],
        :per_page => NUM_RESULTS,
        :apikey => APP_CONFIG['api_key'],


    }

    @name    =   params[:name]
    @id  = params[:id]
    config   =  RequestConfiguration.new("congress.api.sunlightfoundation.com","bills?")
    data_bill = ApiCache.fetch_json_with_cache(options,config,120.hour)
    @bill=  parse_json(data_bill)
  end

end