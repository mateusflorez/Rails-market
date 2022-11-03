class AddFinishDateToAd < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :finish_date, :date
  end
end
