class SkillsController < ApplicationController

  def create
    @character = Character.find(params[:character_id])
    @skill = @character.skills.create(skill_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
    @skill.destroy
    redirect_to character_path(@character)
  end

  def edit
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])
  end

  def update
    @character = Character.find(params[:character_id])
    @skill = @character.skills.find(params[:id])

     if @skill.update(skill_params)
       redirect_to character_path(@character)
     else
       render 'edit'
     end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :value, :icon, :character_id)
  end


end
