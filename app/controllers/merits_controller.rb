class MeritsController < ApplicationController
  before_action :require_login

  def new
    @merit = Merit.new
    @meritee = User.find_by(id: params[:id])
  end

  def create
    @meritee = User.find_by(id: params[:id])
    return redirect_with_error("invalid parameters") unless @meritee.present? && @meritee.organization.id == @user.organization.id

    weeks_merits = @user.given_merits.where("created_at > ?", Time.zone.now.beginning_of_week)
    return redirect_with_error("You have already used your kudos for the week") unless weeks_merits.length < 3

    weeks_merits.each do |wm|
      return redirect_with_error("You already gave #{@meritee.name} kudos this week") if wm.meritee.id == @meritee.id
    end

    @merit = @user.given_merits.new(merit_params)
    @merit.meritee_id = @meritee.id
    if @merit.save
      flash[:success] = "you gave kudos to #{@meritee.name}"
      redirect_to users_show_path
    else
      render "new"
    end

  end

  private

  def redirect_with_error(message)
    flash[:error] = message
    redirect_to users_show_path
  end

  def merit_params
    params.require(:merit).permit(:message)
  end

end
