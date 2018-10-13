class HomeController < ApplicationController

  def index
  end

  def dashboard
    @courses_available = Course.where(["id NOT IN (SELECT course_id FROM course_users WHERE user_id = ?)", current_user.id])
    @complaint_users = ComplaintUser.where(["user_id = ?", current_user.id]).order("created_at DESC")
    @challenges_available = Challenge.where(["id NOT IN (SELECT challenge_id FROM challenge_users WHERE user_id = ?)", current_user.id])
  end
end
