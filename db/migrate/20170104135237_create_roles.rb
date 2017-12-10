class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string   :name

      t.integer  :delete  # 0 - no,  1 - own, 2 - all
      t.integer  :update  # 0 - no,  1 - own
      t.integer  :create  # 0 - no,  1 - yes
      t.integer  :comment # create: 0 - no, 1 - yes
                          # delete: 0 - no, 1 - own, 2 - on own products, 3 - all
                          # update: 0 - no, 1 - own
                          # read:   all

    end
  end
end
