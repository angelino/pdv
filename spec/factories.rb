FactoryGirl.define do  factory :storage_entry do
    reason "MyString"
quantity 1
point_of_sale nil
product nil
  end

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
  end

  factory :point_of_sale do
    name "Point of Sale"
  end
end
