# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140901074217) do

  create_table "archives", :force => true do |t|
    t.string   "name"
    t.string   "git_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "debitor"
  end

  create_table "backends", :force => true do |t|
    t.string   "name"
    t.string   "directory"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "is_default"
    t.integer  "is_active"
  end

  create_table "container_items", :force => true do |t|
    t.integer  "container_id"
    t.integer  "print_model_id"
    t.integer  "quantity"
    t.integer  "material_id"
    t.integer  "print_material_id"
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", :force => true do |t|
    t.string   "description"
    t.integer  "debitor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "queue"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "machines", :force => true do |t|
    t.string   "nick"
    t.string   "uuid"
    t.integer  "print_material_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "state"
    t.float    "nozzle_size"
    t.float    "default_layer_height"
    t.string   "config_file"
    t.integer  "center_x"
    t.integer  "center_y"
    t.integer  "build_size_x"
    t.integer  "build_size_y"
    t.integer  "resets_automatically"
    t.integer  "print_job_batch_id"
    t.string   "uri"
    t.string   "api_key"
  end

  create_table "materials", :force => true do |t|
    t.string   "plastic_type"
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "weight_per_mm"
  end

  create_table "print_job_batches", :force => true do |t|
    t.integer  "print_model_set_id"
    t.integer  "material_id"
    t.integer  "machine_id"
    t.integer  "container_id"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "backend_id"
    t.integer  "is_completed"
    t.string   "plastic_type"
  end

  create_table "print_job_positions", :force => true do |t|
    t.integer  "print_job_id"
    t.integer  "status"
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "duplicate_x"
    t.integer  "duplicate_y"
    t.integer  "backend_id"
    t.float    "percent_done"
    t.float    "print_material_length"
  end

  create_table "print_jobs", :force => true do |t|
    t.integer  "print_model_id"
    t.integer  "quantity"
    t.integer  "material_id"
    t.integer  "priority"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_done",      :default => 0
    t.integer  "quantity_printing",  :default => 0
    t.integer  "quantity_failed",    :default => 0
    t.integer  "backend_id"
    t.float    "nozzle_size"
    t.float    "layer_height"
    t.integer  "print_job_batch_id"
  end

  create_table "print_materials", :force => true do |t|
    t.integer  "material_id"
    t.float    "filament_weight"
    t.float    "filament_left"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "current_diameter"
    t.integer  "is_deleted"
  end

  create_table "print_model_set_positions", :force => true do |t|
    t.integer  "print_model_set_id"
    t.integer  "print_model_id"
    t.integer  "quantity"
    t.float    "default_infill"
    t.string   "default_fill_pattern"
    t.integer  "priority",             :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_model_sets", :force => true do |t|
    t.string   "name"
    t.float    "default_infill"
    t.string   "default_fill_pattern"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "temporary"
  end

  create_table "print_models", :force => true do |t|
    t.string   "filename"
    t.string   "md5sum"
    t.integer  "max_x",                              :default => 1
    t.integer  "max_y",                              :default => 1
    t.float    "default_infill",                     :default => 0.25
    t.float    "default_layer_height",               :default => 0.38
    t.float    "weight"
    t.integer  "printing_time"
    t.integer  "print_more_than_needed_if_possible", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "archive_id"
    t.integer  "print_minimum"
    t.decimal  "x"
    t.decimal  "y"
    t.decimal  "z"
    t.integer  "print_maximum"
    t.string   "fill_pattern"
  end

end
