ActiveAdmin.register User do

  index do

    # show columns
    column          :id
    column          :name
    column          :email
    bool_column     :is_allowed
    bool_column     :is_active
    datetime_column :current_sign_in_at
    datetime_column :last_sign_in_at
    datetime_column :created_at
    default_actions
  end

end
