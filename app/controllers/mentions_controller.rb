class MentionsController < ApplicationController
	before_action :find_mention, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if signed_in?
			@mention = current_user.mentions.order("created_at DESC")
		else
			@mention = Mention.all.order("created_at DESC")
			#this is what tells the homepage to show the mentions in decreasing order
		end
	end

	def show

	end

	def new
		@mention = current_user.mentions.build
	end

	def create
		@mention = current_user.mentions.build(mention_params)

		if @mention.save
			redirect_to @mention, notice: "Successfully created new Mention"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @mention.update(mention_params)
			redirect_to @mention, notice: "Pin was Successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@mention.destroy
		redirect_to root_path
	end

	def upvote
		@mention.upvote_by current_user
		redirect_to :back
	end


	private

	def mention_params
		params.require(:mention).permit(:title, :description, :image)
	end

	def find_mention
		@mention = Mention.find(params[:id])
	end
end
