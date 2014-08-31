class CreateComments < ActiveRecord::Migration
  def change
    create_table "comments", force: true do |t|
      t.text     "content"
      t.integer  "commentable_id"
      t.string   "commentable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree


  end
end
