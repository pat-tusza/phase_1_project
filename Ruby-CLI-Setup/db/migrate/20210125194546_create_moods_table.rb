class CreateMoodsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.string :mood_name
    end
  end
end
