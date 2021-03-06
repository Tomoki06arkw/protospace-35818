class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,          null: false
      t.text :catch_copy,       null: false
      t.text :concept,          null: false
      t.string :content
      t.references :user,       foregin_key: true
      t.timestamps
    end
  end
end
