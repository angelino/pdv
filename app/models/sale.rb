class Sale < ActiveRecord::Base
  belongs_to :saller, class_name: 'User', foreign_key: 'user_id'
  belongs_to :point_of_sale
  has_many :sale_entries, dependent: :destroy
end
