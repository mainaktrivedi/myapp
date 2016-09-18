class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
    	t.string :name, null: false
    	t.references :org, null: false, index: true, foreign_key: true
    	
    	t.timestamps
    end
  end
end
