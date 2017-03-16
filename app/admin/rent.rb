ActiveAdmin.register Rent do
  permit_params :book_id, :user_id, :from, :to

  index do
    selectable_column
    id_column
    column :book
    column :user
    actions
  end

  filter :from
  filter :to
  filter :user, collection: proc { User.pluck :email, :id }
  filter :book

  form do |f|
    f.inputs 'New Rent' do
      f.input :user, as: :select
      f.input :book, as: :select
      f.input :from
      f.input :to
    end
    actions
  end
end
