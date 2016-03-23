class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save answer."
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
