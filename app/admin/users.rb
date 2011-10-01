ActiveAdmin.register User do

  index do
    # show images for true/false/nil
    def bool_column(col)
      column col, :sortable => col do |user|
        value = user.send(col) || 'nil'
        image_tag "#{value}.png", :alt => value, :title => value
      end
    end

    # show datetime format
    def datetime_column(col)
      column col, :sortable => col do |user|
        value = user.send(col).try(:to_s, :datetime) || 'N/A'
        image_tag "#{value}.png", :alt => value, :title => value
      end
    end

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
