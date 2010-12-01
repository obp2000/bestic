module LayoutsHelper
  
  def application_javascripts
    [ "jquery-1.4.2.min", "yoxview/yoxview-init", "jquery-ui.min", "imgpreview.min.0.22.jquery", "rounded", "textile_toolbar",
      "application", "js/jquery.guid", "js/jquery.dotimeout", "js/jquery.shadowon.min", "jquery.bltcheckbox"]
#      ,"prototype", "scriptaculous", "controls", "effects" ]
  end
  
  def application_stylesheets
    [ "jquery-ui-1.8.custom", "nullify", "common" ]
  end
  
  def items_javascripts
    [ "jquery-1.4.2.min", "yoxview/yoxview-init", "jquery-ui.min", "imgpreview.min.0.22.jquery", "rounded",
      "application", "textile-editor", "mColorPicker", "rails", "jquery.form", "jquery.remotipart", "js/jquery.guid", "js/jquery.dotimeout",
      "js/jquery.shadowon.min", "mfsNiceControls" ]
  end
  
  def items_stylesheets
    [ "nullify", "jquery-ui-1.8.custom", "common", "textile-editor" ]
  end
  
  
end
