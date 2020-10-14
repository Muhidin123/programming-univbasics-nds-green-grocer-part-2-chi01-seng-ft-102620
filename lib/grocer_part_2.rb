require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    coupon_item = "#{coupons[counter][:item]} W/COUPON"
    cart_item_coupon = find_item_by_name_in_collection(coupon_item , cart)
    if item && item[:count] >= coupons[counter][:num]
      if cart_item_coupon
        cart_item_coupon[:count] += coupons[counter][:num]
        item[:count] -= coupons[counter][:num]
      else
        cart_item_coupon = {
            :item => coupon_item,
            :price => coupons[counter][:cost] / coupons[counter][:num],
            :clearance => item[:clearance],
            :count => coupons[counter][:num]
        }
        cart << cart_item_coupon
        item[:count] -= coupons[counter][:num]
      end
    end
    counter +=1
  end
  cart
end

def apply_clearance(cart)
end

def checkout(cart, coupons)
end
