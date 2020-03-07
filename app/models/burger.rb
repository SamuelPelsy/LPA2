class Burger < ApplicationRecord
    def get_nutriments
        res = Array.new
        product = Openfoodfacts::Product.get(self.code, locale: 'fr')
        nutri = product.nutriments.to_hash

        if nutri.count == 0
            res.push("Aucun nutriment")
        else
            for ele in nutri
                res.push(ele[0].to_s + " : " + ele[1].to_s)
            end
        end
        return res
    end
end
