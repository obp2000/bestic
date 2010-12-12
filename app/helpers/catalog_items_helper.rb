# coding: utf-8
module CatalogItemsHelper

  def set_drop_receiving_element( element )
    with = <<-EOF
      'id=' + ($(ui.draggable).attr('id')) +
      '&size_id=' + ($(ui.draggable).find('[name=size_id]:checked').val()) + 
      '&colour_id=' + ($(ui.draggable).find('[name=colour_id]:checked').val())      
      EOF
    drop_receiving_element element, :with => with, :accept => ".catalog_item",
        :url => { :controller => "cart_items", :action => "update" }, :tolerance => "touch", :hoverClass => "cart_hover "
  end

  def radio_button_tag_for( attr, checked, visibility )
    attr.radio_button_tag_block[ self, checked, visibility ]
  end
  
  def link_to_index_local( class_const )
    class_const.link_to_index_local_block[ self ]
  end

end