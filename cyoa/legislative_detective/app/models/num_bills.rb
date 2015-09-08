require_relative'../helpers/json_parsing_helper'
require 'pry'
class NumBills

  include JsonParsingHelper
  def initialize
    @sponsor_bills = {}
  end

  def calc_bills(options,config,time,ids)
      ids   =  ids.split('|')
      #update a specific value in hash
      ids.each do |value|

        options[:sponsor_id] = value

        get_num_bills(parse_json(ApiCache.fetch_json_with_cache(options,config,time)))
      end
      calc_most_bills()
  end

  def get_num_bills(bills_hash)
      name_congressman = bills_hash["results"][0]["sponsor"]["first_name"] + "  " + bills_hash["results"][0]["sponsor"]["last_name"]
      num_bills =    bills_hash["count"]
      @sponsor_bills.store(name_congressman,num_bills)
  end

  def calc_most_bills()
    @sponsor_bills.sort_by{|k,v|v}.reverse!
    @sponsor_bills
  end
end