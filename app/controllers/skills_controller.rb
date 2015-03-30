class SkillsController < ApplicationController

  def create
    @character = Character.find(params[:character_id])
    @skill = @character.skills.create(skill_params)
    redirect_to character_path(@character)
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :value, :icon, :character_id)
  end


end
