class ChallengesController < ApplicationController
	before_action :authenticate_user!
  	def new
  		@challenge = Challenge.new
  	end

  	def create
  		@current_user = User.find(current_user.id)
  		@challenge = @current_user.challenges.new(challenge_params)
  		if @challenge.save
  			redirect_to @challenge
  		else
  			render :new
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
