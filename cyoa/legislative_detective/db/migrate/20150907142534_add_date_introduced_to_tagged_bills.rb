class AddDateIntroducedToTaggedBills < ActiveRecord::Migration
  def change
    add_column :tagged_bills, :date_introduced, :datetime
  end
end
