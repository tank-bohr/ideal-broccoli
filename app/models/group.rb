class Group < ApplicationRecord

  KINDS = %w(tag attribute value).freeze

  has_many :group_hosts, dependent: :destroy, inverse_of: :group
  has_many :hosts, through: :group_hosts, inverse_of: :groups

  has_many :restrictions, dependent: :destroy, inverse_of: :group

  validates :name, uniqueness: true
  validates :kind, inclusion: { in: KINDS }
end
