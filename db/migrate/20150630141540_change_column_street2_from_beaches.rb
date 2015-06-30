class ChangeColumnStreet2FromBeaches < ActiveRecord::Migration
  def change
    change_column_null :beaches, :street2, true
  end
end
