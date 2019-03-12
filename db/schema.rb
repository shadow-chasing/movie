# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_19_233258) do

  create_table "actor_records", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_actor_records_on_actor_id"
    t.index ["movie_id"], name: "index_actor_records_on_movie_id"
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "image"
    t.text "content"
    t.boolean "published"
    t.datetime "published_at"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_records", force: :cascade do |t|
    t.integer "character_id"
    t.integer "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_character_records_on_actor_id"
    t.index ["character_id"], name: "index_character_records_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "movie_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "director_records", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_director_records_on_director_id"
    t.index ["movie_id"], name: "index_director_records_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_records", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genre_records_on_genre_id"
    t.index ["movie_id"], name: "index_genre_records_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.text "description"
    t.text "image"
    t.text "byline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "iframe"
    t.string "duration"
    t.string "rating"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "page_type"
    t.string "link_address"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
