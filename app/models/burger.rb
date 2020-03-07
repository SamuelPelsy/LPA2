class Burger < ApplicationRecord
    def nutriments
        product = Openfoodfacts::Product.get(:code, locale: 'fr')
        return product.nutriments.to_hash.count
    end
end
