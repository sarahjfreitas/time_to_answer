class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update,:destroy]
  
  def index
    @subjects = Subject.order(:description).page(params[:page]).per(20)
  end
 
  def new
    @subject = Subject.new
  end
 
  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admins_backoffice_subjects_path, notice: "Assunto registrado com sucesso"
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to admins_backoffice_subjects_path, notice: "Assunto atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    begin
      @subject.destroy!
      redirect_to admins_backoffice_subjects_path, notice: "Assunto excluído com sucesso"
    rescue
      redirect_to admins_backoffice_subjects_path, notice: "Não foi possível excluir"
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:description)
  end
end
