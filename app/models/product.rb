class Product < ActiveRecord::Base
  belongs_to :category
  has_one :spec
  has_many :import_products
  has_many :imports, through: :import_products, source: :import
end
