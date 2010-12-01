require 'spec_helper'

describe "forum_posts/_new" do

  before(:each) do
    assigns[:object] = mock_model(ForumPost).as_new_record.as_null_object
  end
  
  it "renders new forum post form" do
    render
    response.should have_selector("form#new_forum_post") do |form|
      form.should have_selector( "input#forum_post_name", :type => "text", :name => "forum_post[name]" )
      form.should have_selector( "input#forum_post_subject", :type => "text", :name => "forum_post[subject]" )
      form.should have_selector( "textarea#forum_post_body", :name => "forum_post[body]", :content => "" )
      form.should have_selector( "input", :type => "submit" )
    end

  end

end
