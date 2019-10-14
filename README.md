```ユーザーテーブル
create_table "users", force: :cascade do |t|
  t.string "name"
  t.string "email"
  t.string "password_digest"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

```タスクテーブル
create_table "tasks", force: :cascade do |t|
  t.string "title
  t.text "state"
  t.datetime "limit_date"
  t.integer "priority"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.bigint "user_id"
  t.index ["user_id"], name: "index_tasks_on_user_id"
end
```

```ラベルテーブル
create_table "labels", force: :cascade do |t|
  t.string "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

```タスクとラベル中間テーブル
create_table "labellings", force: :cascade do |t|
  t.integer "label_id"
  t.integer "task_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

```外部キー
add_foreign_key "comments", "feeds"
add_foreign_key "tasks", "users"
add_foreign_key "labellings", "tasks"
add_foreign_key "labellings", "labels"
```