# Helper methods for parsing json.
module JsonParsingHelper

  def parse_json(json)
   results  =  JSON.parse(json)
   results
  end
end