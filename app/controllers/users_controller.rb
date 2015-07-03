class UsersController < ApplicationController
  before_action :require_login

  def show

    weeks_merits = @user.given_merits.where("created_at > ?", Time.zone.now.beginning_of_week)
    team = @user.organization.users

    @weeks_merit_count = weeks_merits.length
    @meritees = []
    @candidates = []
    
    team.each do |team_mate|
      unless team_mate.id == @user.id
        already_recipient = false
        weeks_merits.each do |wm|
          already_recipient = true if wm.meritee_id == team_mate.id
        end
        if already_recipient
          @meritees.push team_mate
        else
          @candidates.push team_mate
        end
      end
    end
  end

end
