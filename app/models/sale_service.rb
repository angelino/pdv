class SaleService
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  # Create a new sale based on params:
  #
  # {
  #   "items" => [
  #     {
  #       "product_id" => "1",
  #       "quantidade" => "1"
  #     },
  #   ],
  #   "commercial_conditions" => []
  # }
  def create!(params)
    ActiveRecord::Base.transaction do
      # TODO: Security problem - mass assign
      items_params = params.require(:items)
      puts ">>> #{items_params}"

      storage = Storage.new(point_of_sale_id: params[:id])
      puts ">>> #{storage.inspect}"

      puts ">>> #{current_user}"
      sale = Sale.new(point_of_sale_id: params[:id], user_id: current_user.id)
      sale.save!

      items_params.each do |item_params|
        puts ">>> #{item_params}"
        puts ">>> #{item_params['product_id']}"

        storage_item = storage.find_item(product_id: item_params['product_id'])
        puts ">>> Item found on Storage... #{storage_item.inspect}"

        raise I18n.translate("storage.product.insuficient_quantity",
                             product_id: item_params[:product_id],
                             quantity: storage_item.quantity) if (!storage_item || ((storage_item.quantity - item_params[:quantity].to_i) < 0))

        # storage_entries
        #   product_id
        #   point_of_sales_id
        #   reason
        #   quantity
        storage_entry = StorageEntry.new(product_id:       storage_item.product.id,
                                         point_of_sale_id: storage.point_of_sale.id,
                                         storage_entry_type_id:        self.find_parameterized_reason_id!,
                                         quantity:         (-(item_params[:quantity]).to_i),
                                         movement_date:    Time.zone.now)
        puts ">>> #{storage_entry.inspect}"

        storage_entry.save!

        # sale_entries
        #   sale_id = nil
        #   price_at_date
        #   storage_entry_id
        #   quantity
        sale_entry = SaleEntry.new(sale_id:          sale.id,
                                   price_at_date:    storage_item.product.price,
                                   storage_entry_id: storage_entry.id,
                                   quantity:         item_params[:quantity])
        sale_entry.save!

        puts ">>> #{sale.inspect} created"
        return sale
      end
    end
  end
  private
    def find_parameterized_reason_id!
      StorageEntryType.find_by_sell_marker!(true)
    end
end
