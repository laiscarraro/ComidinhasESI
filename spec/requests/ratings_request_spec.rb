require 'rails_helper'

RSpec.describe "Ratings", type: :request do
    describe "Acessar página de avaliações" do
        it "deveria redirecionar para a página de login quando não estou logado" do
            allow(Product).to receive(:find)

            get new_product_rating_path(product_id: 1)

            expect(response).to redirect_to(login_index_path)
        end

        it "deveria acessar a página de avaliações quando estou logado" do
            allow_any_instance_of(ActionDispatch::Request).to receive(:session) { {user_id: 1} }

            fake_user = double('User', :avatar => nil, :username => nil, :id => nil)
            fake_product = double('Product', :user => fake_user)
            allow(Product).to receive(:find) {fake_product}
            expect(Product).to receive(:find).with("1")

            get new_product_rating_path(product_id: 1)

            expect(response).to render_template(:new)
        end
    end

    describe "Fazer uma avaliação" do
        it "deveria procurar o usuário logado" do
            fake_rating = double('Rating', :rate_value= => nil, :commentary= => nil, :user= => nil, :product= => nil, :save => true)
            allow(Rating).to receive(:new) {fake_rating}
            allow_any_instance_of(ActionDispatch::Request).to receive(:session) { {user_id: 1} }
            expect(User).to receive(:find).with(1)
            allow(Product).to receive(:find)
            
            post product_ratings_path(product_id: 1)
        end
        
        it "deveria procurar o produto a ser avaliado" do
            fake_rating = double('Rating', :rate_value= => nil, :commentary= => nil, :user= => nil, :product= => nil, :save => true)
            allow(Rating).to receive(:new) {fake_rating}
            allow(User).to receive(:find)
            expect(Product).to receive(:find).with("2")

            post product_ratings_path(product_id: 2)
        end

        it "deveria armazenar as informações da avaliação nos respectivos campos" do
            fake_rating = double('Rating', :save => true)
            allow(Rating).to receive(:new) {fake_rating}
            
            fake_user = double('User')
            allow(User).to receive(:find) {fake_user}

            fake_product = double('Product')
            allow(Product).to receive(:find) {fake_product}

            expect(fake_rating).to receive(:rate_value=).with("5")
            expect(fake_rating).to receive(:commentary=).with("Muito Bom!")
            expect(fake_rating).to receive(:user=).with(fake_user)
            expect(fake_rating).to receive(:product=).with(fake_product)

            post product_ratings_path(product_id: 3), :params => {:rate_value => 5, :commentary => "Muito Bom!"}
        end

        it "deveria ser redirecionado para a página do produto ao salvar uma avaliação" do
            fake_rating = double('Rating', :rate_value= => nil, :commentary= => nil, :user= => nil, :product= => nil, :save => true)
            allow(Rating).to receive(:new) {fake_rating}
            allow(User).to receive(:find)
            allow(Product).to receive(:find)

            post product_ratings_path(product_id: 4)

            expect(response).to redirect_to(product_path(id: 4))
        end

        it "deveria renderizar uma mensagem javascript quando houver erros ao salvar" do
            custom_errors = [[1,"Erro 1"],[2, "Erro 2"]]
            fake_rating = double('Rating', :rate_value= => "1", :commentary= => nil, :user= => nil, :product= => nil, :save => false, :errors => custom_errors)
            allow(Rating).to receive(:new) {fake_rating}
            allow(User).to receive(:find)
            allow(Product).to receive(:find)
           
            post product_ratings_path(product_id: 5)

            expect(response.body).to eq("alert('2 erros na sua avaliação:\\nErro 1\\nErro 2');")
        end
    end

    describe "ver uma avaliação" do
        it "deveria procurar o produto" do
            expect(Product).to receive(:find).with("1")          
            fake_product = double('Product')
            fake_ratings = double('Ratings', :empty? => true)
            allow(Product).to receive(:find){fake_product}
            allow(fake_product).to receive(:ratings){fake_ratings}
           


            get product_ratings_path(product_id: 1)
        end     
        
        it "deveria recuperar todas as avaliações do produto" do                 
            fake_rating = double('Rating', :rate_value= => "1", :commentary= => nil, :user= => nil, :product= => nil, :save => false)
            fake_product = double('Product')
            fake_ratings = double('Ratings', :empty? => true)
            allow(Product).to receive(:find){fake_product}
            allow(fake_product).to receive(:ratings){fake_ratings}
            expect(fake_product).to receive(:ratings)
            
   
            get product_ratings_path(product_id: 1)
        end   

        it "deveria mostrar uma mensagem quando não há avaliações" do                 
            fake_rating = double('Rating', :rate_value= => "1", :commentary= => nil, :user= => nil, :product= => nil, :save => false)
            fake_product = double('Product')
            fake_ratings = double('Ratings', :empty? => true)
            allow(Product).to receive(:find){fake_product}
            allow(fake_product).to receive(:ratings){fake_ratings}          
            
   
            get product_ratings_path(product_id: 1)

            expect(response.body).to include("Não há avaliações para este produto")
        end 
        
        
        it "deveria mostrar a avaliação do usuário" do   

            fake_user_1 = double('User', :username => "Zé linguiçeiro" )
            fake_rating_1 = double('Rating', :rate_value => "5", :commentary => "Que linguiçona!", :user => fake_user_1)
            
            fake_user_2 = double('User', :username => "Dani Bananeiro" )
            fake_rating_2 = double('Rating', :rate_value => "3", :commentary => "Que linguiçinha!", :user => fake_user_2)

            fake_ratings = [fake_rating_1, fake_rating_2]
            fake_product = double('Product', :ratings => fake_ratings)       
           
                   
            allow(Product).to receive(:find){fake_product}                  
            
   
            get product_ratings_path(product_id: 1)

            expect(response.body).to include("<h1 id='username_1'>Zé linguiçeiro</h1>")
            expect(response.body).to include("<h1 id='rate_value_1'>5</h1>")
            expect(response.body).to include("<h1>Que linguiçona!</h1>")            
            expect(response.body).to include("<h1 id='username_2'>Dani Bananeiro</h1>")
            expect(response.body).to include("<h1 id='rate_value_2'>3</h1>")
            expect(response.body).to include("<h1>Que linguiçinha!</h1>")  
            
        end 
    end
end
