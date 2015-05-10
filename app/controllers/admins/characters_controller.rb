class Admins::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  layout 'admins'

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    if @character.save
      redirect_to admins_user_path(:id => [@character.user])
    else
      render 'new'
    end
  end

	def show 
	  @skills = @character.skills
	end

  def edit

  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to admins_user_url([@character.user]), notice: 'Character was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

	def destroy
    @character.destroy
    redirect_to admins_user_url([@character.user]), notice: 'Character was successfully destroyed.'
	end
    
  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :avatar, :character_id, :user_id)
  end	
end