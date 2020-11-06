require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "Cadastrar uma avaliação" do
    before(:each) do
      @product = Product.new
      @user = User.new
    end

    it "deveria ser válido quando se dá uma nota 5 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 5
      rating.commentary = "Muito Bom!"
      rating.user = @user
      rating.product = @product

      expect(rating).to be_valid
    end

    it "deveria ser válido quando se dá uma nota 4 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 4
      rating.commentary = "Bom!"
      rating.user = @user
      rating.product = @product

      expect(rating).to be_valid
    end
    
    it "deveria ser válido quando se dá uma nota 3 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 3
      rating.commentary = "Regular!"
      rating.user = @user
      rating.product = @product

      expect(rating).to be_valid
    end

    it "deveria ser válido quando se dá uma nota 2 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 2
      rating.commentary = "Ruim!"
      rating.user = @user
      rating.product = @product

      expect(rating).to be_valid
    end

    it "deveria ser válido quando se dá uma nota 1 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 1
      rating.commentary = "Muito Ruim!"
      rating.user = @user
      rating.product = @product

      expect(rating).to be_valid
    end

    it "deveria ser inválido quando se dá uma nota maior que 5 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 6
      rating.commentary = "Excepcional!"
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid
    end

    it "deveria ser inválido quando se dá uma nota menor que 1 e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 0
      rating.commentary = "Terrível!"
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid
    end

    it "deveria ser inválido quando se dá uma nota quebrada e se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 3.5
      rating.commentary = "Regular - Bom!"
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid
    end

    it "deveria ser inválido quando não se dá uma nota" do
      rating = Rating.new
      rating.commentary = "Muito Bom!"
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid      
    end

    it "deveria ser inválido quando não se escreve um comentário" do
      rating = Rating.new
      rating.rate_value = 4
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid
    end

    it "deveria ser inválido quando não se dá uma nota nem se escreve um comentário" do
      rating = Rating.new
      rating.user = @user
      rating.product = @product

      expect(rating).not_to be_valid
    end
  end
end
