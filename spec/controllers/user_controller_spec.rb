require 'rails_helper'
require 'spec_helper'

RSpec.describe UserController, type: :controller do
    context 'sem produtos' do
        it 'ratings_mean deveria retornar nil' do
            user = User.new
            user.username = "Reinaldo do Dogão"
            user.email = "reinaldoDoDogao@gmail.com"
            user.password = "Rei123"
            user.id = 1
            @products = Product.joins(:user).where("user_id = #{user.id}")
            expect(controller.ratings_mean(@products)).to eq(nil)
        end
    end

    context 'sem avaliações' do
        it 'ratings_mean deveria retornar zero' do
            user = User.new
            user.username = "Reinaldo do Dogão"
            user.email = "reinaldoDoDogao@gmail.com"
            user.password = "Rei123"
            user.id = 1

            category = Category.new
            category.name = "Categoria para me ajudar a passar em ESI"
            category.save

            photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

            product1 = Product.new
            product1.name = "Cones do Wilson"
            product1.price = 6.00
            product1.description = "Cone bom para testes!"
            product1.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
            product1.photo = photo
            product1.user = user
            product1.save

            @products = Product.joins(:user).where("user_id = #{user.id}")

            expect(controller.ratings_mean(@products)).to eq(0)
        end
    end

    context 'com avaliações' do
        it 'ratings_mean deveria retornar a média das avaliações' do
            user = User.new
            user.username = "Reinaldo do Dogão"
            user.email = "reinaldoDoDogao@gmail.com"
            user.password = "Rei123"
            user.id = 1
            user.save

            category = Category.new
            category.name = "Categoria para me ajudar a passar em ESI"
            category.save

            photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

            product1 = Product.new
            product1.name = "Cones do Wilson"
            product1.price = 6.00
            product1.description = "Cone bom para testes!"
            product1.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
            product1.photo = photo
            product1.user = user
            product1.id = 123
            product1.save

            rating1 = Rating.new
            rating1.rate_value = "5"
            rating1.commentary = "bom"
            rating1.user = user
            rating1.product = product1
            rating1.save

            rating2 = Rating.new
            rating2.rate_value = "2"
            rating2.commentary = "nao bom"
            rating2.user = user
            rating2.product = product1
            rating2.save

            @products = Product.joins(:user).where("user_id = 1")

            expect(controller.ratings_mean(@products)).to eq(3.5)
        end
    end
end