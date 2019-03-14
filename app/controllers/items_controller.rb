class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy]


	def index
		@user=current_user
		@items = Item.all.order("created_at DESC") 

	end
	
	def new
		@item =Item.new
		# @item=current_user.items.build
		@user=current_user
		# @item.user_id = current_user.id

	end

	def show
		
	end

	def create
		# byebug
		# @item = current_user.items.build(item_params)
		# @user=current_user
		@item = Item.create(
				user_id: current_user.id,
				title: params[:item][:title],
				description: params[:item][:description],
				avatar: params[:item][:avatar]
			)
		# @item.avatar = params[:file] 
		# @item.title = params[:item][:title]
		# @item.description = params[:item][:description]
		# @item.avatar = params[:item][:avatar]
		
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
			params.require(:item).permit(:title, :description, :file)
		end

		def find_item
			@item=Item.find(params[:id])
		end
	


end
