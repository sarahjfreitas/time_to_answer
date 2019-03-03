class AdminsBackoffice::AdminController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end
end
