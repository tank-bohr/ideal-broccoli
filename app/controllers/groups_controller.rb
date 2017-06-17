class GroupsController < ApplicationController
  def index
    @title = 'Groups'
    @groups = Group.all.order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @title = "Group ##{@group.id}"
  end

  def create
    @group = Group.new(permitted)
    if @group.valid?
      @group.save!
      redirect_to groups_path
    else
      render :new
    end
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find params[:id]
    @title = "Edit group ##{@group.id}"
  end

  def update
    @group = Group.find params[:id]
    if @group.update(permitted)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    group = Group.find params[:id]
    group.destroy!
    redirect_to groups_path
  end

  private

  def permitted
    params.require(:group).permit(:name, :kind, :comment)
  end
end
