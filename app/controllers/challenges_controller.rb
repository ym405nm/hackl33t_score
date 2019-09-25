class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all.order("id": "desc").limit(30)
    @questions = Question.all
    @user = current_user

    # 全問正解かどうか調べる
    question_num = @questions.count
    @last_item = Challenge.where("result": 1).where("user_id": @user).order("question_id": "desc")
    resolve_num = @last_item.count
    @clear_flag = false
    if resolve_num >= question_num
      @clear_flag = true
    end

    if @last_item.exists?
      @last_item_question_id = @last_item.first().question_id
    else
      @last_item_question_id = 0
    end
    logger.debug(@last_item_question_id)
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    if "admin" != current_user.username
      raise ActionController::RoutingError.new('Not Found')
    end
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
    if "admin" != current_user.username
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # POST /challenges
  # POST /challenges.json
  def create
    if "admin" != current_user.username
      raise ActionController::RoutingError.new('Not Found')
    end
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    if "admin" != current_user.username
      raise ActionController::RoutingError.new('Not Found')
    end
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    if "admin" != current_user.username
      raise ActionController::RoutingError.new('Not Found')
    end
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:user_id, :question_id, :result)
    end
end
