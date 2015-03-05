class ImportProduct < ActiveRecord::Base
  belongs_to :import, inverse_of: :import_products
  belongs_to :product

  validates_associated :import
  validates_presence_of :product_id
  validates_presence_of :product_unit
  validates_numericality_of :product_unit
end
