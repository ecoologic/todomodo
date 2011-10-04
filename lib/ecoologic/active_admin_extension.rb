module ActiveAdmin
  module Views
    class TableFor < Arbre::HTML::Table

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

    end
  end
end
