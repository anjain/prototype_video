class UserProfileController < ApplicationController
  skip_before_filter :check_profile_setup, only: [:new, :create]

  def new
    if current_user.user_profile.present?
      redirect_to edit_user_profile_path(current_user.user_profile.id)
    else
      @user_profile = UserProfile.new
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id
    if @user_profile.save
      redirect_to user_profile_index_path
    else
      render :new
    end
  end

  def index
    @user_profile = current_user.user_profile
  end

  def edit
    if params[:id].to_i == current_user.user_profile.id
      @user = current_user
      @camera_info = [ENV['camera_tag_id'], ENV['camera_tag_app_id']]
      unless @user.video.present?
        @video = @user.build_video
      else
        @video = @user.video
      end
    else
      flash[:alert] = "You cannot edit others profile."
      redirect_to user_profile_index_path
    end
  end

  def update
    @camera_info = [ENV['camera_tag_id'], ENV['camera_tag_app_id']]
    @user = current_user
    user_profile = @user.user_profile
    unless @user.video.present?
      @video = @user.build_video
    else
      @video = @user.video
    end
    if @user.update_attributes(update_user_params)
      user_profile.skill_1_efficiency = user_profile.get_effciency_value(params[:user][:user_profile_attributes][:skill_1_efficiency])
      user_profile.skill_2_efficiency = user_profile.get_effciency_value(params[:user][:user_profile_attributes][:skill_2_efficiency])
      user_profile.skill_3_efficiency = user_profile.get_effciency_value(params[:user][:user_profile_attributes][:skill_3_efficiency])
      if user_profile.save
        if params[:video][:video_uuid].present?
          @video.uuid = params[:video][:video_uuid]
          @video.url = params[:video][:qvga][:video]
          @video.user_id = current_user.id
          if @video.save
            redirect_to user_profile_index_path
          else
            @user.errors.add(:base, 'Video not recorded properly')
            render :edit
          end
        else
          redirect_to user_profile_index_path
        end
      else
        render :edit
      end
    else
      render :edit
    end
  end

  private
  def user_profile_params
    params.require(:user_profile).permit(:name, :location, :dob, :current_job, :skill_1, :skill_2, :skill_3)
  end

  def update_user_params
    params.require(:user).permit(user_profile_attributes:[
                                  :id,
                                  :name,
                                  :location,
                                  :dob,
                                  :current_job,
                                  :skill_1,
                                  :skill_2,
                                  :skill_3,
                                  :objective,
                                  :image])
  end
end