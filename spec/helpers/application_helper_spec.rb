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
 
  describe "#link_to_add_to_item( object )" do

    it "renders link to function for adding object to item" do
      @object = sizes_proxy.first
      helper.should_receive( :link_to_function )
      helper.link_to_add_to_item( @object )      
    end    
    
  end 

  describe "#link_to_show_photo( photo )" do
    
    before do
      @photo = photos_proxy.first      
    end

    it "renders link to show fullsize photo" do
      helper.link_to_show_photo( @photo ).should have_thumbnail( @photo )
    end
      
    context "with comment" do
      
      it "renders show comment" do
        helper.link_to_show_photo( @photo, true ).should contain( @photo.comment )  
      end
      
    end

    context "without comment" do
      
      it "does not render show comment" do
        helper.link_to_show_photo( @photo, false ).should_not contain( @photo.comment )  
      end
      
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
end
