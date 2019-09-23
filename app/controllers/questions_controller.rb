class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :result
  before_action :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    question_id = params[:id]
    if check_question(question_id, current_user)
      # Good
    else
      # Bad
      render "questions/block"
    end
    @check_resolved = check_resolved(question_id, current_user)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #POST
  def result
    flag = params[:flag]
    @question_id = params[:question_id]
    # 問題を解いていいかどうか調べる
    if check_question(@question_id, current_user)
    else
      # 問題を解いてはいけないので返す
      redirect_to action: 'show', id: @question_id and return
    end
    # 問題が既に解かれていないかどうか調べる
    if check_resolved(@question_id, current_user)
      # 既に登録済み
      logger.debug("This question is already resolved.")
      flash[:danger] = "既に問題解かれています"
      redirect_to controller:'questions', action: 'show', id: @question_id and return
    else
      # 正解フラグを調べる
      question = Question.find(@question_id)
      correct_answer = question.answer
      # 正解かどうかを確認する
      if flag == correct_answer
        # 正解
        # 登録作業
        Challenge.create(user_id: current_user.id, question_id: @question_id, result: 1).save
        render 'correct'
      else
        # 不正解
        # 登録作業
        Challenge.create(user_id: current_user.id, question_id: @question_id, result: 0).save
        render 'wrong'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # 問題に挑戦していいかどうか（ステップをスキップしていないかどうか）を調べる
    def check_question (question_id, current_user)
      if question_id == "1"
        # Good
      else
        # 今のIDとchallengeのラストIDが適切かどうかを確認する
        expect_last_id = question_id.to_i - 1
        @user = current_user
        c_check = Challenge.where("question_id": expect_last_id).where("user_id": current_user)
        if c_check.exists?
          # Good
        else
          # Bad
          return false
        end
      end
      return true
    end

    # 問題が既に解かれていないかどうかを調べる
    def check_resolved (question_id, current_user)
      resolve_check = Challenge.where("question_id": question_id).where("user_id": current_user).where("result": 1)
      if resolve_check.exists?
        # Good (問題が解かれているのでtrueを返す)
        return true
      else
        # Bad (問題が解かれていないのでfalseを返す)
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :image_url, :answer, :description)
    end
end
