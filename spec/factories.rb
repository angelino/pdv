FactoryGirl.define do
  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   admin false
  # end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end

  factory :product do
    name "Product"
    barcode "123456--qualquer coisa eu aceito"
  end

  factory :image do
    owner :product
    public_id "MyString"
  end

  factory :point_of_sale do
    name "Point of Sale"
  end

  factory :storage_entry do
    association :storage_entry_type, factory: :storage_entry_type
    quantity 1
    point_of_sale :point_of_sale
    product :product
    movement_date Date.today
  end

  factory :storage_entry_type do
    reason "Add product at storage"
    plus_minus_marker true
    sell_marker false
  end

  factory :sell_storage_entry_type, class: StorageEntryType do
    reason "Sell Of Product"
    plus_minus_marker false
    sell_marker true
  end

  factory :user do
    email "exemplo@gmail.com"
    password "lucas_cabecao"
  end

  factory :sale do
    user :user
    point_of_sale :point_of_sale
  end
end
