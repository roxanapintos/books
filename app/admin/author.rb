ActiveAdmin.register Author do
  # importing data
  active_admin_import

  # downloading data csv
  csv do
    column :first_name
    column :last_name
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  sidebar 'Books by this Author', :only => :show do
    table_for Book.joins(:author).where(:author_id => author.id) do |t|
      t.column("Title") { |book| book.name }
    end
  end
end
