class AddDateIssuedToTaggedBills < ActiveRecord::Migration
  def change
    add_column :tagged_bills, :date_issued, :datetime
  end
end
