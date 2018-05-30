require "uuid"
require "granite/adapter/sqlite"
class Store < Granite::Base
  adapter sqlite

  field name : String
  field path : String
  field password : String

  #validate_not_nil :name
  #validate_not_blank :name

  #validate_not_nil :path
  #validate_not_blank :path

  #validate_not_nil :password
end

Store.migrator.drop_and_create