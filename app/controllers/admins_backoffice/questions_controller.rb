class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update,:destroy]
  
  def index
    @questions = Question.includes(:subject).order('id desc').page(params[:page]).per(20)
  end
 
  def new
    @question = Question.new
    @subjects = Subject.order(:description)
  end
 
  def edit
    @subjects = Subject.order(:description)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admins_backoffice_questions_path, notice: "Questão registrada com sucesso"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admins_backoffice_questions_path, notice: "Questão atualizada com sucesso"
    else
      render :edit
    end
  end

  def destroy
    begin
      @question.destroy!
      redirect_to admins_backoffice_questions_path, notice: "Questão excluída com sucesso"
    rescue
      redirect_to admins_backoffice_questions_path, notice: "Não foi possível excluir"
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:description,:subject_id, answers_attributes: [:id, :description, :correct, :_destroy])
  end
end
