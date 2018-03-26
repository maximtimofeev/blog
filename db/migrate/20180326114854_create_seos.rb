class CreateSeos < ActiveRecord::Migration[5.1]
  def change
    create_table :seos do |t|
      t.string :keywords
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
