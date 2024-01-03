class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.text :body
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
