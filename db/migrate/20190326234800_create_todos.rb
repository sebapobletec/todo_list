class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :photo
      t.string :title

      t.timestamps
    end
  end
end
