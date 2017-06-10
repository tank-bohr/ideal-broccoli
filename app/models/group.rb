class Group < ApplicationRecord
  has_many :group_hosts, dependent: :destroy, inverse_of: :group
  has_many :hosts, through: :group_hosts, inverse_of: :groups

  has_many :restrictions, dependent: :destroy, inverse_of: :group

  validates :kind, inclusion: { in: %w(tag attribute value) }
end
