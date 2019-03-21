class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author, :category_id, :user_pic
end
