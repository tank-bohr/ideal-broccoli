class GroupsController < ApplicationController
  def index
    @title = 'Groups'
    @groups = Group.all.order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @title = "Group ##{@group.id}"
  end
end
