# This file is auto-generated from the current state of the database. Instead of editing this file,
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(version: 20_101_102_142_833) do
  create_table 'customers', force: true do |t|
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string   'name'
  end

  create_table 'project_groups', force: true do |t|
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string   'name'
  end

  create_table 'projects', force: true do |t|
    t.string   'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text     'description'
    t.integer  'state'
    t.integer  'customer_id'
    t.date     'start_date'
    t.date     'end_date'
    t.integer  'project_group_id'
  end

  create_table 'statuses', force: true do |t|
    t.integer  'code', default: 0
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer  'task_id'
    t.text     'comment'
  end

  create_table 'tasks', force: true do |t|
    t.string   'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer  'project_id'
    t.integer  'project_group_id'
    t.integer  'task_id'
  end
end
