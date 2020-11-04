require 'rails_helper'

RSpec.describe "Ratings", type: :request do
    it "deveria receber uma requisição post e chamar o método find de Produto" do
        expect(Product).to receive(:find).with("1")

        fake_ratings = double("Ratings", :create => "")        
        fake_product = double("Product", :ratings => fake_ratings)
        allow(Product).to receive(:find){fake_product}
        
        post '/product/1/ratings', :params => {:rating => {:rate_value => "5", :commentary => "Muito Bom!"}, :format => :json}
    end

    it "deveria receber uma requisição post e salvar a avaliação" do
        fake_ratings = double("Ratings")        
        fake_product = double("Product", :ratings => fake_ratings)
        allow(Product).to receive(:find){fake_product}

        params = ActionController::Parameters.new({:rating => {:rate_value => "5", :commentary => "Muito Bom!"}})
        expect(fake_ratings).to receive(:create).with(params.require(:rating).permit(:rate_value, :commentary))

        post '/product/1/ratings', :params => {:rating => {:rate_value => "5", :commentary => "Muito Bom!"}, :format => :json}
    end
end
