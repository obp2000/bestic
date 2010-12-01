require 'spec_helper'

describe "items/_season" do

  before(:each) do
    @season = seasons_proxy.first
  end
  
  it "renders season in form for item" do
    render :locals => { :season => @season }
    response.should have_selector( "input#item_season_id_#{@season.id}", :type => "radio",
          :name => "item[season_id]", :value => @season.to_param )  
    response.should have_selector( "img", :src => "/images/" + @season.icon )          
  end

end
