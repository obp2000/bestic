require 'spec_helper'

describe ApplicationHelper do

  describe "#link_to_season( season_class )" do
    
    it "renders link to season" do
      [ SummerCatalogItem, WinterCatalogItem, CatalogItem ].each do |season_class|
        helper.link_to_season( season_class ).should have_text( regexp_for_remote_get( send( "#{season_class.name.tableize}_path" ) ) )
      end
    end
  
  end

  describe "#link_to_category( category, season_class )" do
    
    before do
      @category = categories_proxy.first  
    end
        
    it "renders link to category" do
      [ SummerCatalogItem, WinterCatalogItem, CatalogItem ].each do |season_class|
        helper.link_to_category( @category, season_class ).should
                  have_text( regexp_for_remote_get( send( "category_#{season_class.name.tableize}_path", @category ) ) )
      end
    end
  
  end  

  describe "#link_to_delete( object )" do

    it "renders link to delete object" do
      [ sizes_proxy.first, colours_proxy.first, categories_proxy.first, photos_proxy.first, cart_items_proxy.first, items_proxy.first, orders_proxy.first ].each do |object|
        object.stub( :delete_image_with_title ).and_return( "delete.png", :title => "Удалить?" )          
        helper.link_to_delete( object ).should
                have_text( regexp_for_remote_delete( send( "#{object.class.name.underscore}_path", object ) ) )
      end
    end    
    
  end

  describe "#link_to_show( photo )" do
    
    before do
      @photo = photos_proxy.first
      @photo.stub( :link_to_show ).with( helper ).and_return( link_to image_tag( @photo.public_filename( :small ) ),
          @photo.public_filename )      
    end

    it "renders link to show fullsize photo" do
      helper.link_to_show( @photo ).should have_thumbnail( @photo )
      helper.link_to_show( @photo ).should_not contain( @photo.comment )       
    end

  end   

  describe "#link_to_show_with_comment( photo )" do
    
    before do
      @photo = photos_proxy.first
      @photo.stub( :link_to_show_with_comment ).with( helper ).and_return( link_to image_tag( @photo.public_filename(
                :small ) ) + @photo.comment, @photo.public_filename )      
    end

    it "renders link to show fullsize photo and photo comment" do
      helper.link_to_show_with_comment( @photo ).should have_thumbnail( @photo )
      helper.link_to_show_with_comment( @photo ).should contain( @photo.comment )       
    end

  end  
  
  describe "#render_options( objects )" do

    context "when renders 'not any' options" do
      
      before do
        @objects = catalog_items_proxy.first.sizes
      end      
    
      it "renders partial attr with not checked and visible options" do
        helper.should_receive( :render ).with( :partial => "catalog_items/attr", :collection => @objects,
            :locals => { :checked => false, :visibility => "visible" } )    
        helper.render_options( @objects )      
      end    

    end

    context "when renders single attribute" do
      
      before do
        @catalog_item = catalog_items_proxy.first
        @catalog_item.stub( :sizes ).and_return( [ sizes_proxy.first ] )
        @objects = @catalog_item.sizes
      end
       
      it "renders partial attr with checked and hidden option" do
        helper.should_receive( :render ).with( :partial => "catalog_items/attr", :collection => @objects,
            :locals => { :checked => true, :visibility => "hidden" } )    
        helper.render_options( @objects )      
      end     
    end

    context "when renders 'any' option" do
      
      before do
        @objects = sizes_proxy.first.class.new
      end
       
      it "renders partial attr with checked and visible option" do
        helper.should_receive( :render ).with( :partial => "catalog_items/attr", :collection => [ @objects ],
            :locals => { :checked => true, :visibility => "visible" } )    
        helper.render_options( @objects )      
      end     
    end
    
  end   
  
  describe "#render_attrs( attrs )" do

    context "when renders 'not any' attrs" do
      
      before do
        @attrs = catalog_items_proxy.first.sizes
      end    
  
      it "renders partial with collection of attrs" do
        helper.should_receive( :render ).with( :partial => "shared/size", :collection => @attrs, :spacer_template => "shared/comma" )            
        helper.render_attrs( @attrs )   
      end
    
    end

    context "when renders 'any' attr" do
      
      before do
        @attrs = sizes_proxy.first.class.new
      end    
  
      it "renders partial with collection of attrs" do
        helper.render_attrs( @attrs ).should == "Любой"   
      end
    
    end

  end

  describe "#link_to_delete( object )" do
    
    before do
      @object = sizes_proxy.first
      @object.stub( :link_to_delete ).with( helper ).and_return( link_to_remote @object.name,
            :url => size_path( @object ), :method => :delete )
    end
    
    it "renders link to delete object" do
      helper.link_to_delete( @object ).should have_text( regexp_for_remote_delete( size_path( @object ) ) ) 
    end
    
  end

  describe "#link_to_show( object )" do
    
    before do
      @object = catalog_items_proxy.first
      @object.stub( :link_to_show ).with( helper ).and_return( link_to_remote @object.name,
            :url => catalog_item_path( @object ), :method => :get )      
    end
    
    it "renders link to show object" do
      helper.link_to_show( @object ).should have_link_to_remote_get( catalog_item_path( @object ) ) do |a|
        a.should contain( @object.name )      
      end
    end
    
  end

  describe "#link_to_reply_to( object )" do
    
    before do
      @object = forum_posts_proxy.first
      @object.stub( :link_to_reply_to ).with( helper ).and_return( link_to_remote @object.name,
            :url => reply_forum_post_path( @object ), :method => :get )        
    end
    
    it "renders link to reply to forum post" do
      helper.link_to_reply_to( @object ).should have_link_to_remote_get( reply_forum_post_path( @object ) ) 
    end
    
  end

  describe "#link_to_close( object )" do
    
    before do
      @object = processed_orders_proxy.first
      @object.stub( :link_to_close ).with( helper ).and_return( link_to_remote "Test",
            :url => close_processed_order_path( @object ), :method => :get )          
    end
    
    it "renders link to close order" do
      helper.link_to_close( @object ).should have_text( regexp_for_remote_close( close_processed_order_path( @object ) ) ) 
    end
    
  end

  describe "#link_to_remote1( image, text, url, opts )" do
    
    before do
      @image = ""
      @text = "Test"
      @url = [ "catalog_items_path" ]
      @opts = { :method => :get }
    end
    
    it "renders link to remote" do
      helper.link_to_remote1( @image, @text, @url, @opts ).should have_link_to_remote_get( catalog_items_path ) do |a|
        a.should contain( @text )      
      end      
    end
    
  end

  describe "#link_to_index( class_const )" do
    
    before do
      @class_const = forum_posts_proxy.first.class
    end
    
    it "renders link to list of objects" do
      helper.link_to_index( @class_const ).should have_link_to_remote_get( forum_posts_path )
    end
    
  end

  describe "#index_page_title_for( class_const )" do
    
    before do
      @class_const = catalog_items_proxy.first.class
    end
    
    it "renders page title" do
      @class_const.should_receive( :index_page_title_for )       
      helper.index_page_title_for( @class_const ) 
    end
    
  end

  describe "#link_to_change" do

    it "renders link to change item attribute" do
      Size.stub( :link_to_change ).and_return( link_to_remote "Test", :url => sizes_path, :method => :get )
      helper.link_to_change( Size ).should have_link_to_remote_get( sizes_path )       
    end    
    
  end 

end
