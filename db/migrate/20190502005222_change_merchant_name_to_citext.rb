class ChangeMerchantNameToCitext < ActiveRecord::Migration[5.2]
  def change
    enable_extension("citext")

    change_column :merchants, :name, :citext
  end
end
