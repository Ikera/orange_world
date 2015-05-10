class Admins::SkillsController < ApplicationController
  before_action :set_skill, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!

  layout 'admins'

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(skill_params)
    if @skill.save
      redirect_to admins_character_url([@skill.character])
    else
      render 'new'
    end
  end

  def destroy
    @skill.destroy
    redirect_to admins_character_url(@skill.character), notice: 'Skill was successfully destroyed.'
  end

  def edit
  end

  def update
     respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to admins_character_url([@skill.character]), notice: 'Skill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    @skill.update(skill_params)
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :value, :icon, :character_id)
  end
end
