ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
  permit_params do
    permitted = [:permitted, :attributes]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  index do
    selectable_column
    column :id
    column :firstname
    column :lastname
    column :email

    column :created_at
    column :updated_at

    actions
  end


  form do |f|
    f.inputs 'Details' do
      f.input :firstname
      f.input :lastname
      f.input :description
      f.input :email
    end

    f.inputs 'Password' do
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end


end
