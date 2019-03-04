class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_admin, only: [:edit, :update,:new]
  
  def index
    @admins = Admin.all
  end
 
  def new
  end
 
  def edit
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: "Administrador registrado com sucesso"
    else
      render :new
    end
  end
  def update
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso"
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = params[:id].present? ? Admin.find(params[:id]) : Admin.new
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
