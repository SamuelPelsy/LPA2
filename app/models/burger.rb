class Burger < ApplicationRecord
    def get_nutriments
        res = Array.new
        res.push("Aucun nutriment")
        product = Openfoodfacts::Product.get(self.code, locale: 'fr')
        if(!product.nil.present?)
            nutri = product.nutriments.to_hash
            if nutri.count != 0
                for ele in nutri
                    res.push(ele[0].to_s + " : " + ele[1].to_s)
                end
            end
        end
        return res
    end
end
