class AdminsBackoffice::AdminController < AdminsBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_admin, only: [:edit, :update]
  
  def index
    @admins = Admin.all
  end
  
  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admin_index_path, notice: "Administrador atualizado com sucesso"
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def verify_password
    if params[:admin][:password].blank? &&  params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

  def admin_params
    params.require(:admin).permit(:email,:password,:password_confirmation)
  end
end
