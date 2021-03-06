ActiveAdmin.register Poll do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:title, :description, :user_id, :category_id, :active, options_attributes: [ :id, :value, :ord, :label, :_destroy ]]

    #permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # before_create do |poll|
  #   poll.user = current_user
  # end

  index do
    selectable_column
    column :id
    column :user
    column :active
    column :category
    column :title
    column :description

    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :user
      row :active
      row :category
    end


    panel "Options" do
      table_for poll.options do
        column :id
        column :label
        column :value
        column :ord
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      # f.input :user, as: :select, collection: User.all, include_blank: true, input_html: { disabled: true, value: current_user.id }
      f.input :user, as: :select, collection: options_for_select(User.all.map{|u| [u.fullname, u.id]}, (f.object.new_record? ? current_user.id : f.object.user.id)), include_blank: true, input_html: { disabled: false } 
      f.input :active
      f.input :category
      f.input :title
      f.input :description
    end

    f.inputs 'Options' do
      f.has_many :options, allow_destroy: true, sortable: :ord  do |t|
        t.input :label
        t.input :value
      end
    end


    f.actions
  end

end

ActiveAdmin.register Option do
  belongs_to :poll
end
