class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end


  # GET /questions/new
  def new
    @question = Question.new
  end


  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
     if @question.save
       redirect_to question_path(@question)
     else
       flash[:error] = "Invalid question! Make sure title is 20 chars and description is 30."
       render :new
     end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid question! Make sure title is 20 chars and description is 30."
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    if @question.destroy!
      flash[:notice] = "question #{@question.title} has been Destroyed!"
      redirect_to questions_path
    end
  end
  private

def question_params
  params.require(:question).permit(
    :title,
    :description
  )
end

end
