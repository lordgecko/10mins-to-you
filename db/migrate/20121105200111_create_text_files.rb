class CreateTextFiles < ActiveRecord::Migration
  def change
    create_table :text_files do |t|

      t.timestamps
    end
  end
end
