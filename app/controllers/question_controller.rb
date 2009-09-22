class QuestionController < ApplicationController
  def index
    @for_options = ForOption::find(:all, :order => 'id').sort do |a, b|
      if a.id == 1
        1
      elsif b.id == 1
        -1
      else
        a.id <=> b.id
      end
    end
  end

  def list
    if params[:id] and (for_option = ForOption::find(params[:id]))
      @for_option = for_option
    else
      redirect_to :action => 'index'
    end
  end

  def show
    @question = Question::find(params[:id])
  end

  def rss
    @questions = Question::find(:all, :order => 'created_on DESC')
    render_without_layout
  end

  def new
    @question = session[:question] || Question.new
    @question.for_option_id = params[:id] if params[:id]
  end

  def confirm
    if params[:question]
      @question = Question.new(params[:question])
      session[:question] = @question
      render :action => 'new' unless @question.valid?
    else
      redirect_to :action => 'new'
    end
  end

  def create
    @question = session[:question]
    if params['post']
      if @question.save
        flash[:notice] = 'Question was successfully posted below.'
        cancel
      else
        render :action => 'new'
      end
    elsif params['back']
      redirect_to :action => 'new'
    elsif params['cancel']
      redirect_to :action => 'cancel'
    end
  end

  def cancel
    session[:question] = nil
    redirect_to :action => 'index'
  end
end
