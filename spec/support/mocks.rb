def items_proxy
    [ mock_model( Item, valid_item_attributes1 ).as_null_object,
      mock_model( Item, valid_item_attributes2 ).as_null_object ]               
end

def catalog_items_proxy
    [ mock_model( CatalogItem, valid_item_attributes1 ).as_null_object ]
end

def forum_posts_proxy
      [ mock_model(ForumPost, valid_forum_post_attributes).as_null_object ]
end

def order_items_proxy
    [ mock_model( OrderItem, valid_order_item_attributes2 ).as_null_object ]
end

def orders_proxy
    [ mock_model( Order, valid_order_attributes1 ).as_null_object ]
end

def processed_orders_proxy
    [ mock_model( ProcessedOrder, valid_order_attributes1 ).as_null_object ]
end

def closed_orders_proxy
  closed_order = mock_model( ClosedOrder, valid_order_attributes1 ).as_null_object
  closed_order.stub( :status ).and_return( "ClosedOrder" )
  [ closed_order ]  
end

def categories_proxy
    [ mock_model( Category, valid_category_attributes ).as_null_object,
      mock_model( Category, valid_category_attributes2 ).as_null_object              ]
end

def sizes_proxy
      [ mock_model( Size, valid_size_attributes ).as_null_object,
        mock_model( Size, valid_size_attributes2 ).as_null_object ]
end

def colours_proxy
      [ mock_model( Colour, valid_colour_attributes ).as_null_object,
        mock_model( Colour, valid_colour_attributes2 ).as_null_object ]
end

def photos_proxy
    photo = mock_model( Photo, valid_photo_attributes2 ).as_null_object
    photo.stub(:public_filename).with(:small).and_return("photo_of_jacket_small")
    [ photo ]
end

def cart_items_proxy
    [ mock_model( CartItem, valid_cart_item_attributes2 ).as_null_object ]
end

def carts_proxy
    [ mock_model( Cart, valid_carts_attributes ).as_null_object ]
end

def contacts_proxy
    [ mock_model( Contact, valid_contact_attributes).as_null_object ]            
end

def users_proxy
    [ mock_model( User, valid_user_attributes ).as_null_object ]
end

####### valid_attributes
def valid_item_attributes
            { :name => "Shirt",
              :blurb => "Jacket for walking",
              :price => "500",
              :category_id => 1,
              :type => "SummerCatalogItem"
              }
end
def valid_item_attributes1
              { :name => "Jacket",
              :price => 700,
              :created_at => Time.now,
              :updated_at => Time.now,
              :category => categories_proxy.first,
              :type => "SummerCatalogItem", 
              :sizes => sizes_proxy,
              :colours => colours_proxy,
              :photos => photos_proxy,
              :blurb => "New jacket",
              :created_at => Time.now,
              :updated_at => Time.now }
end
def valid_item_attributes2
              { :name => "Shirt",
              :price => 500,
              :created_at => Time.now,
              :updated_at => Time.now,
              :category => categories_proxy.first,
              :type => "SummerCatalogItem", 
              :sizes => sizes_proxy,
              :colours => colours_proxy,
              :photos => photos_proxy,
              :blurb => "New jacket",
              :created_at => Time.now,
              :updated_at => Time.now }          
end

def valid_forum_post_attributes
              { :name => "Oleg",
              :subject => "Message theme",
              :body => "Message body",
              :created_at => Time.now,
              :updated_at => Time.now,              
              :parent_id => 0 }  
end

def valid_order_item_attributes
           { :item => items_proxy.first,
             :size_id => sizes_proxy.first,
             :colour_id => colours_proxy.first,
             :amount => 5 }  
end
def valid_order_item_attributes2
             { :name => "Shirt",
             :size_id => sizes_proxy.first,
             :colour_id => colours_proxy.first,
             :amount => 5,
             :notice => items_proxy.first.name }
end             

def valid_order_attributes
           { :email => "obp2000@mail.ru",
              :phone_number => "123-45-67",
              :ship_to_first_name => "John",
              :ship_to_city => "Moscow",
              :ship_to_address => "Address1",
              :comments => "Comments1",
              :status => "ProcessedOrder",
              :captcha_validated => true
  }  
end

def valid_order_attributes1              
              { :email => "obp2000@mail.ru",
              :phone_number => "123-45-67",
              :ship_to_first_name => "John",
              :ship_to_city => "Moscow",
              :ship_to_address => "Address1",
              :comments => "Comments1",
              :status => "ProcessedOrder",
              :total => "500",
              :created_at => Time.now,
              :updated_at => Time.now,
              :items => items_proxy,
              :order_items => order_items_proxy }
end              

def valid_processed_order_attributes
   { :email => "obp2000@mail.ru",
                            :phone_number => "123-45-67",
                            :ship_to_first_name => "John" }
end

def valid_category_attributes
  { :name => "Shirts" }
end

def valid_category_attributes2
  { :name => "Jackets" }
end

def valid_size_attributes
  { :name => "XL"  }
end

def valid_size_attributes2
  { :name => "L"  }
end

def valid_colour_attributes
  { :name => "Red", :html_code => "#FF0000" }
end

def valid_colour_attributes2
  { :name => "Green", :html_code => "#00FF00" }
end

def valid_photo_attributes
  { :filename => "photo_of_jacket", :comment => "Photo of jacket" }
end

def valid_photo_attributes2
  { :public_filename => "photo_of_jacket", :comment => "Photo of jacket" }
end              

def valid_carts_attributes
            { :cart_items => cart_items_proxy,
            :total_items => 1,
            :total => 500 }
end            

def valid_cart_item_attributes
            { :price => 500,
            :amount => 1,
            :item_id => 1,
            :size_id => 1,
            :colour_id => 1 }
end

def valid_cart_item_attributes2
            { :name => catalog_items_proxy.first.name,
            :price => 500,
            :amount => 1,
            :catalog_item => catalog_items_proxy.first,
            :size => sizes_proxy.first,
            :colour => colours_proxy.first }
end

def valid_contact_attributes
            { :email => "obp2000@mail.ru",
            :name => "Oleg",
            :phone => "123-45-67",
            :icq => "123-456-789",
            :address => "Moscow",
            :photo => "photo1" }  
end

def valid_user_attributes
            { :login => "obp2000",
            :email => "obp2000@mail.ru",
            :first_name => "Oleg",
            :last_name => "Petrov",
            :password => "1111111",
            :pw_reset_code => "abcdefg" }
end            
