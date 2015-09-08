class CreateTaggedBills < ActiveRecord::Migration
  def change
    create_table :tagged_bills do |t|
      t.string :bill_description
      t.string :chamber
      t.text :tags
      t.datetime :date_introduced
      t.datetime :date_issued
      t.timestamps null: false
    end
  end
end
