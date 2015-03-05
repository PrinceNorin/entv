class Import < ActiveRecord::Base
  has_many :import_products, inverse_of: :import
  has_many :products, through: :import_products, source: :product

  before_save :add_product_to_stock

  validates_presence_of :description

  accepts_nested_attributes_for :import_products, allow_destroy: true

  private

    def add_product_to_stock
      import_products.each do |import_product|
        product = import_product.product
        product.update_attribute(:total, product.total + import_product.product_unit)
      end
    end
end
