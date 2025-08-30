class Users::Show::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
