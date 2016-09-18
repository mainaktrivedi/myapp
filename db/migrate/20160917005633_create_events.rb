class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

    	t.timestamp :occurred_at, null: false
    	t.string :description, null: false
    	t.references :host, null: false, index: true, foreign_key: true

    	t.timestamps
    	
    end
  end
end
