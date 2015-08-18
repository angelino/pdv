class Sale < ActiveRecord::Base
  validates :saller, presence: true
  validates :point_of_sale, presence: true

  belongs_to :saller, class_name: 'User', foreign_key: 'user_id'
  belongs_to :point_of_sale
  has_many :sale_entries, dependent: :destroy
end
