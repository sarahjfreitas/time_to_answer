class AdminsBackoffice::AdminController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end
  def edit
    @admin = Admin.find(params[:id])
  end
  def update
    @admin = Admin.find(params[:id])
    admin_params = params.require(:admin).permit(:email,:password,:password_confirmation)
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admin_index_path, notice: "Administrador atualizado com sucesso"
    else
      render :edit
    end
  end
end
