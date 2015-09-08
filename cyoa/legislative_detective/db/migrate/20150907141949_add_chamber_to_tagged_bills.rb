class AddChamberToTaggedBills < ActiveRecord::Migration
  def change
    add_column :tagged_bills, :chamber, :string
  end
end
