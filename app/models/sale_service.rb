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
      Rails.logger.info ">>> #{items_params}"

      storage = Storage.new(point_of_sale_id: params[:id])
      Rails.logger.info ">>> #{storage.inspect}"

      Rails.logger.info ">>> #{current_user}"
      sale = Sale.new(point_of_sale_id: params[:id], user_id: current_user.id)
      sale.save!

      items_params.each do |item_params|
        Rails.logger.info ">>> #{item_params}"
        Rails.logger.info ">>> #{item_params['product_id']}"

        storage_item = storage.find_item(product_id: item_params['product_id'])
        Rails.logger.info ">>> Item found on Storage... #{storage_item.inspect}"

        raise I18n.translate("storage.product.insuficient_quantity",
                             product_id: item_params[:product_id],
                             quantity: storage_item.quantity) if (!storage_item || ((storage_item.quantity - item_params[:quantity].to_i) < 0))

        # storage_entries
        #   product_id
        #   point_of_sales_id
        #   reason
        #   quantity
        storage_entry = StorageEntry.new(product_id:            storage_item.product.id,
                                         point_of_sale_id:      storage.point_of_sale.id,
                                         storage_entry_type:    find_parameterized_sell_reason!,
                                         quantity:              item_params[:quantity].to_i,
                                         movement_date:         Time.zone.now)
        Rails.logger.info ">>> #{storage_entry.inspect}"

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

        Rails.logger.info ">>> #{sale.inspect} created"
        return sale
      end
    end
  end

  private
    def find_parameterized_sell_reason!
      StorageEntryType.find_by_sell_marker!(true)
    end
end
