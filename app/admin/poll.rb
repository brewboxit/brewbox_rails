ActiveAdmin.register Poll do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:title, :description]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    column :id
    column :user
    column :title
    column :description

    column :created_at
    column :updated_at

    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user
      f.input :title
      f.input :description
    end
  end

end
