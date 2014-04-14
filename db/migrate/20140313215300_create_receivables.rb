class CreateReceivables < ActiveRecord::Migration
  def change
    create_table :receivables do |t|
      t.string :debtor
      t.string :email
      t.float :total_debt
      t.float :in_debt
      t.references :user, index: true

      t.timestamps
    end
  end
end
