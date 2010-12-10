class Object
 
  def send_if_respond( action ); send(action) if respond_to?(action); end
  
  def colon; self + ":"; end

  def cart
    if self[:cart_id]
      Cart.find self[:cart_id]
    else
      self[:cart_id] = ( cart1 = Cart.create ).id
      cart1
    end
  end

  def total; inject(0) {|sum, n| n.price * n.amount + sum}; end

  def to_array; is_a?( Array ) ? self : to_a; end

end
