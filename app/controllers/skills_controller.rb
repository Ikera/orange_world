class SkillsController < ApplicationController
  before_action :set_character, only: [:create, :destroy, :edit, :update]
  before_action :set_skill, only: [:edit, :update, :destroy]
  respond_to :js

  def create
    @skill = @character.skills.build(skill_params)
    
    @skill.save 
    
    respond_to do |format|   
        format.js
    end
  end

  def destroy
    @skill.destroy
  end

  def edit
  end

  def update
    @skill.update(skill_params)
  end

  private

  def set_character
    @character = current_user.characters.find(params[:character_id])
  end

  def set_skill
    @skill = @character.skills.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :value, :icon, :character_id)
  end
end
