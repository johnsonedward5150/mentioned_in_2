class MentionsController < ApplicationController
	before_action :find_mention, only: [:show, :edit, :update, :destroy]

	def index
		@mention = Mention.all.order("created_at DESC")
		#this is what tells the homepage to show the mentions in decreasing order
	end

	def show

	end

	def new
		@mention = Mention.new
	end

	def create
		@mention = Mention.new(mention_params)

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

	private

	def mention_params
		params.require(:mention).permit(:title, :description)
	end

	def find_mention
		@mention = Mention.find(params[:id])
	end
end
