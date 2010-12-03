module Shared
    
    def index_render; { :template => "shared/index.rjs" }; end
    def show_render; { :template => "shared/show.rjs" }; end      
    def create_render; { :template => "shared/create_or_update.rjs" }; end
    def update_render; { :template => "shared/create_or_update.rjs" }; end
    def destroy_render; { :template => "shared/destroy.rjs" }; end
    def new_render; { :template => "shared/new_or_edit.rjs" }; end
    def edit_render; { :template => "shared/new_or_edit.rjs" }; end

end
