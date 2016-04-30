class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.string :securityCode

      t.timestamps null: false
    end
  end
end
