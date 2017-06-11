class RestrictionsController < ApplicationController
  def index
    @title = 'Restrictions'
    @restrictions = Restriction.
      includes(:group, :dependent_group).
      order(created_at: :desc)
  end
end
