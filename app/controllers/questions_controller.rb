class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    # question_params = params.require(:question).permit(:question, :description)
    @question = Question.new(question_params)
    if @question.save
      # At this stage, I can never get the page to redirect to index when a question is posted, and I have no idea why. I can only render the "show" page. Is this something that's built into Rails?
      redirect_to "/questions/#{@question.id}"
    else
      flash[:error] = "Oops, something went wrong! Try posting again."
    end
  end

  def show
    id = params[:id]
    @question = Question.find(id)
    render :show
  end

  def edit
    id = params[:id]
    @question = Question.find(id)
    render :edit
  end

  def update
    id = params[:id]
    question = Question.find(id)

    # get updated data
    # updated_attributes = params.require(:question).permit(:question, :description)
    # update the question
    question.update_attributes(question_params)

    #redirect to show
    redirect_to "/questions/#{id}"
  end

  def destroy
    id = params[:id]
    question = Question.find(id)
    question.destroy
    redirect_to "/questions"
  end

  private

    def question_params
      params.require(:question).permit(:question, :description)
    end


end
