ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :locale
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :locale

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
    end
  end

  form do |f|
    f.inputs 'User' do
      f.input :first_name
      f.input :last_name
      f.input :email
      if object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    actions
  end
end
