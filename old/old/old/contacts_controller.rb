class ContactsController < ApplicationController
before_filter :login_required, :only => [ :edit, :update ]
before_filter :find_contacts

  def update
    if @object.update_attributes(params[:contact])
      flash[:notice] = 'Контакты успешно обновлены.'
      redirect_to edit_contact_path(@object)
    else
      render :action => "edit"  
    end
  end
  
  protected

  def find_contacts
    @object = Contact.first
    @page_title = Contact.page_title
  end
  
end
