class HomeController < ApplicationController

  def index
  end

  def dashboard
    @courses_available = Course.where(["id NOT IN (SELECT course_id FROM course_users WHERE user_id = ?)", current_user.id])
    @complaints = current_user.complaints
    @challenges_available = Challenge.where(["id NOT IN (SELECT challenge_id FROM challenge_users WHERE user_id = ?)", current_user.id])
  end
end
