class AddRestaurantsAssociationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :user_id, :integer
    add_index 'restaurants', ['user_id'], name: 'index_user_id'
  end
end
