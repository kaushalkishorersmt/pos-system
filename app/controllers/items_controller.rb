class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /items
  # GET /items.json
  def index
    if params[:item].present?
      tag_id =  params[:item][:tag_ids].to_i
      item_ids = ItemsTag.where(tag_id: tag_id).pluck(:item_id).uniq
      @items = Item.where(id: item_ids)
    else
      @items = Item.all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    tag_ids = @item.items_tag.pluck(:tag_id)
    @tags = Tag.where(id: tag_ids).pluck(:name)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    tag_ids = params[:item][:tag_ids].map!(&:to_i)
    tag_ids.drop(1)

      if @item.save
        tag_ids.each do |tag_id|
          ItemsTag.create(tag_id: tag_id, item_id: @item.id)
        end
        respond_to do |format|
          format.html { redirect_to @item, notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    tag_ids = params[:item][:tag_ids].map!(&:to_i)
    tag_ids.drop(1)
    ItemsTag.where(item_id: @item.id).destroy_all
    tag_ids.each do |tag_id|
      ItemsTag.create(tag_id: tag_id, item_id: @item.id)
    end

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    ItemsTag.where(item_id: @item.id).destroy_all
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :tag_ids)
    end
end
