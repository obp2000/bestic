require 'spec_helper'

describe "forum_posts/_index" do

  before(:each) do
    assigns[:objects] = forum_posts_proxy
    template.stub(:will_paginate)
  end
  
  it "renders only one existing forum post" do
    render
    response.should contain( assigns[:objects].first.subject )      
    response.should contain( assigns[:objects].first.name )
    response.should contain(assigns[:objects].first.created_at.strftime("%d.%m.%y"))
    response.should contain(assigns[:objects].first.created_at.strftime("%H:%M:%S"))        
  end

end
