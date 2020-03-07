class Burger < ApplicationRecord
    def get_nutriments
        res = Array.new
        res.push("Aucun nutriment")
        if(!self.code.nil?)
            product = Openfoodfacts::Product.get(self.code, locale: 'fr') 
            if(product.present?)
                nutri = product.nutriments.to_hash
                if nutri.count != 0
                    for ele in nutri
                        res.push(ele[0].to_s + " : " + ele[1].to_s)
                    end
                end
            end
        end
        return res
    end
end
