class JewelsController < ApplicationController
  before_action :set_jewel, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @jewels = current_user.jewels
  end

  def show
    @photos = @jewel.photos
  end

  def new
    @jewel = current_user.jewels.build
  end

  def create
    @jewel = current_user.jewels.build(jewel_params)

    if @jewel.save

      if params[:images] 
        params[:images].each do |image|
          @jewel.photos.create(image: image)
        end
      end

      @photos = @jewel.photos
      redirect_to edit_jewel_path(@jewel), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    if current_user.id == @jewel.user.id
      @photos = @jewel.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @jewel.update(jewel_params)

      if params[:images] 
        params[:images].each do |image|
          @jewel.photos.create(image: image)
        end
      end

      redirect_to edit_jewel_path(@jewel), notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_jewel
      @jewel = Jewel.find(params[:id]) 
    end
    
    def jewel_params
      params.require(:jewel).permit(:product_code, :jewel_type, :metal_type, :stone_type, :weight, :stone_weight, :purity,
        :pieces_number, :listing_name, :summary, :address, :in_stock, :is_shipping, :price, :active, :user)
    end
  end