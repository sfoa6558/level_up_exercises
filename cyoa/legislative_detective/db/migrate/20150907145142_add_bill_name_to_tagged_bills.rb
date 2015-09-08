class AddBillNameToTaggedBills < ActiveRecord::Migration
  def change
    add_column :tagged_bills, :bill_name, :string
  end
end
