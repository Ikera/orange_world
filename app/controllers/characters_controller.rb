class CharactersController < ApplicationController
  before_action :all_characters, only: [:index, :create, :destroy]
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :authorized_user, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_character

  def index
  end

  def show
  end

  def new
    @character = current_user.characters.build
  end

  def edit
  end

  def create
    @character = current_user.characters.build(character_params)

    respond_to do |format|
      if @character.save
        format.js
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.js
    end
  end

  private

    def authorized_user
      @character = current_user.characters.find_by(id: params[:id])
      redirect_to characters_path, notice: "Not authorized to edit this character!" if @character.nil?
    end

    def all_characters
      @characters = current_user.characters.order("created_at DESC").page(params[:page]).per(4)
    end
    
    def set_character
      @character = current_user.characters.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :avatar)
    end

     def invalid_character
      logger.error "Attempt to access invalid character #{params[:id]}"
      redirect_to root_path, notice: 'Invalid character!'
    end
end
