class BoardsController < ApplicationController
	def index
		@boards = Board.all
	end

	def new
		@board = Board.new
	end

	def show
		@board = Board.find(params[:id])
	end

	def edit
		@board = Board.find(params[:id])
	end

	def create
		@board = Board.new(params_board)
		if @board.save
			redirect_to board_url(@board)
		else
			render "new"
		end
	end

	def update
		@board = Board.find(params[:id])
		if @board.update_attributes(params_board)
			redirect_to board_url(@board)
		else
			render "edit"
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to boards_url
	end

	private
	def params_board
		params.require(:board).permit(:title, :editor)
	end

end