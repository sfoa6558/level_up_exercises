class AddBillDescToTaggedBills < ActiveRecord::Migration
  def change
    add_column :tagged_bills, :bill_desc, :string
  end
end
