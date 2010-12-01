class ContactsController < ApplicationController
before_filter :login_required, :only => [ :edit, :update ]
  
end
