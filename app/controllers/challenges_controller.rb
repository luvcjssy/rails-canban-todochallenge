class ChallengesController < ApplicationController
	before_action :authenticate_user!
    def index
      @challenges = Challenge.where(:creator_id => current_user.id)
    end

  	def new
  		@challenge = Challenge.new
  	end

  	def create
  		@current_user = User.find(current_user.id)
  		@challenge = @current_user.challenges.new(challenge_params)
      respond_to do |format|
    		if @challenge.save
    			format.html { redirect_to challenges_path, notice: 'Challenge was successfully created.' }
    		else
    			format.html { render :new }
    		end
      end
  	end

  	def show
  		@challenge = Challenge.find(params[:id])
  	end

  	private
  	def challenge_params
  		params.require(:challenge).permit(:name, :starts_on, :description)
  	end
end
