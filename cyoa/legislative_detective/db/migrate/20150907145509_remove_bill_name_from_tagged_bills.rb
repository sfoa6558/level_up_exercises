class RemoveBillNameFromTaggedBills < ActiveRecord::Migration
  def change
    remove_column :tagged_bills, :bill_name, :string
  end
end
