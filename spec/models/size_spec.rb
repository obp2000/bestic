require 'spec_helper'

describe Size do
  
  before do
    @valid_attributes = valid_size_attributes
    @size = Size.new( @valid_attributes )
    @params = { "size" => valid_size_attributes }
    @updated_params = { "size" => { :name => "S" } }      
    @session = {}
    @flash = {}
    @flash.stub( :now ).and_return( @flash )       
  end

  it "is valid with valid attributes" do
    @size.should be_valid
  end

  it "is not valid without a name" do
    @size.name = nil
    @size.should_not be_valid
  end
  
  it "should have unique name" do
    @size = Size.create(@valid_attributes)
    @size = Size.create(@valid_attributes)    
    @size.errors.size.should == 1
  end

  describe ".class_name_rus" do
    it "is a string" do
      Size.class_name_rus.class.should == String
    end
  end

  describe ".class_name_rus_cap" do
    it "is a string" do
      Size.class_name_rus_cap.class.should == String
    end
  end

  describe "#new_object" do
  
    it "builds new size" do
      @size = Size.new_object( @params, @session )
      @size.name.should == valid_size_attributes[ :name ]
    end
  
  end
 
  describe "#save_object" do
  
    it "saves new size" do
      create_size
      @size.reload
      @size.name.should == valid_size_attributes[ :name ]
      @flash.now[ :notice ].should contain( "создан" )         
    end
  
  end  
  
  describe "#update_object" do
  
    it "updates existing size" do
      create_size
      @size = Size.update_object( @updated_params.merge( :id => @size.id ), @session, @flash ).first
      @size.name.should == @updated_params[ "size" ][ :name ]
      @flash.now[ :notice ].should contain( "обновлён" )         
    end
  
  end
  
  describe "#destroy_object" do
  
    it "destroys existing size" do
      create_size
      @params_for_destroy = { :id => @size.id }
      @size = Size.destroy_object( @params_for_destroy, @session, @flash )
      @size.name.should == valid_size_attributes[ :name ]
      Size.all.should_not include( @size )
      @flash.now[ :notice ].should contain( "удалён" )           
    end
  
  end

end
