class Admins::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :destroy]
  before_action :authenticate_admin!

  layout 'admins'

	def show 
	  @skills = @character.skills
	end

	def destroy
    @character.destroy
    redirect_to admins_user_url([@character.user]), notice: 'Character was successfully destroyed.'
	end
    
  private

  def set_character
    @character = Character.find(params[:id])
  end

  def char_params
    params.require(:char).permit(:name, :avatar, :char_id)
  end	
end