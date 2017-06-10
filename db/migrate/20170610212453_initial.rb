class Initial < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.text :comment

      t.timestamps
    end

    create_table :restrictions do |t|
      t.references :group, null: false, foreign_key: { on_delete: :cascade }
      t.string :kind, null: false
      t.references :dependent_group, null: true, default: nil,
        foreign_key: { to_table: :groups, on_delete: :cascade }

      t.timestamps
    end

    create_table :hosts do |t|
      t.string :fqdn, null: false

      t.timestamps
    end

    create_table :group_hosts do |t|
      t.references :group, null: false, foreign_key: { on_delete: :cascade }
      t.references :host, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :groups, :name, unique: true
    add_index :groups, :created_at

    add_index :hosts, :fqdn, unique: true
    add_index :hosts, :created_at

    add_index :group_hosts, [:group_id, :host_id], unique: true
  end
end
