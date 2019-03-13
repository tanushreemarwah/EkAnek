class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy]


	def index
		@items = Item.all.order("created_at DESC")
	end
	
	def new
		# @item =Item.new
		@item=current_user.items.build
		@user=current_user
	end

	def show
		
	end

	def create
		@item = current_user.items.build(item_params)
		# @item = Item.create(
		# 		title: params[:item][:title],
		# 		description: params[:item][:description]
		# 	)
	
		if @item.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @item.update(item_params)
			redirect_to item_path(@item)
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	private
		def item_params
			params.require(:item).permit(:title, :description)
		end

		def find_item
			@item=Item.find(params[:id])
		end
	


end
