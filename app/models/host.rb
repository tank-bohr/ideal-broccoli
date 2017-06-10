class Host < ApplicationRecord
  has_many :group_hosts, dependent: :destroy, inverse_of: :host
  has_many :groups, through: :group_hosts, inverse_of: :hosts

  validates :fqdn, uniqueness: true
end
