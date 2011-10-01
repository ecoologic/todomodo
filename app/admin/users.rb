ActiveAdmin.register User do

  index do
    # show images for true/false/nil
    def self.bool_column(col)
      column col, :sortable => col do |user|
        value = user.send(col.to_s) || 'nil'
        image_tag "#{value}.png"
      end
    end

    column :id
    column :name
    column :email
    bool_column :is_admin
    bool_column :is_allowed
    bool_column :is_active
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    default_actions
  end

end
