class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name
      t.boolean :status,default: false ,null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
