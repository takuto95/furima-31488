class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category

belongs_to :user
has_one_attached :image
belongs_to :sales_status
belongs_to :shipping_fee_status
belongs_to :prefecture
belongs_to :scheduled_delivery

with_options presence:true do
validates :image
validates :name
validates :detail
validates :item_price, numericality: {only_integer: true, message: "is invalid. Input half-width characters."}
validates :category_id
validates :sales_status_id
validates :shipping_fee_status_id
validates :prefecture_id
validates :scheduled_delivery_id
end

validates :category_id, numericality: { other_than: 1 }
validates :sales_status_id, numericality: { other_than: 1}
validates :shipping_fee_status_id, numericality: { other_than: 1 }
validates :prefecture_id, numericality: { other_than: 1 }
validates :scheduled_delivery_id, numericality: { other_than: 1 }
validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end
