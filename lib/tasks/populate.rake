namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [User, Product, Image, PointOfSale, StorageEntry].each(&:delete_all)

    User.populate(2) do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = Faker::Internet.password(8)
      user.sign_in_count = Faker::Number.between(1, 10)
      user.admin = true
    end

    Product.populate(10) do |product|
      product.name = Faker::Commerce.product_name
      product.description = Faker::Lorem.sentence
      product.price = Faker::Commerce.price
      product.barcode = Faker::Number.number(10)

      Image.populate(0..1) do |image|
        image.owner_id = product.id
        image.public_id = "qt3hfubhf3e7e16uggkg"
        image.owner_type = "Product"
      end
    end

    PointOfSale.populate(5) do |pos|
      pos.name = Faker::Company.name

      Product.all.each do |product|
        StorageEntry.populate(1..5) do |storage_entry|
          storage_entry.point_of_sale_id = pos.id
          storage_entry.product_id = product.id
          storage_entry.quantity = Faker::Number.between(1, 10)
        end
      end
    end

  end
end
