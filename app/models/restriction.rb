class Restriction < ApplicationRecord
  belongs_to :group, inverse_of: :restrictions
  belongs_to :dependent_group, class_name: 'Group', optional: true

  validates :group, presence: true
  validates :kind, inclusion: { in: %w(value_of required requires) }
end
