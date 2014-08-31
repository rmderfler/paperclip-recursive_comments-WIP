class CreateLinks < ActiveRecord::Migration
  def change

    create_table "links", force: true do |t|
      t.string   "title"
      t.string   "url"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
