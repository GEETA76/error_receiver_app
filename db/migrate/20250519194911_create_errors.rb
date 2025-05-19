class CreateErrors < ActiveRecord::Migration[8.0]
  def change
    create_table :errors do |t|
      t.string :error_class
      t.text :message
      t.text :backtrace
      t.string :path
      t.string :method
      t.datetime :timestamp

      t.timestamps
    end
  end
end
