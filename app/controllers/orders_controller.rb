class OrdersController < ApplicationController
  before_filter :login_required, :only => [ :index, :show, :close, :destroy ]
    
end
