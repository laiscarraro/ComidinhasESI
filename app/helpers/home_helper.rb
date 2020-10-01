module HomeHelper
    def product_category_path(idCategory)
        {controller: 'home', action: 'category', id: idCategory}
    end
end
