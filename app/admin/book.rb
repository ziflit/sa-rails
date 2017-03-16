ActiveAdmin.register Book do
  permit_params :title, :author, :genre, :year, :publisher, :image

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :genre
    column :year
    column :publisher
    column :image
    actions
  end

  filter :title
  filter :author
  filter :genre
  filter :year
  filter :publisher
end
