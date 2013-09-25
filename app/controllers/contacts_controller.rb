class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_path, notice: 'Contact was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
