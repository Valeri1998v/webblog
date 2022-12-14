class QuestionsController < ApplicationController
    before_action :set_question, only: %i[update show destroy edit]   
    def create
        question = Question.create(params[:questions])

        redirect_to question_path(@question)
    end

    def update
        @question.update(question_params)
        redirect_to question_path(@questions)
    end

    def destroy
        @question.destroy

        redirect_to questions_path
    end

    def show
        @question = Question.find(params[:id])
    end

    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def edit
    end

    private

    def question_params
        question_params = params.require(:question).permit(:body, :user_id)
    end

    def set_question
        @question = Question.find(params[:id])
    end

end
