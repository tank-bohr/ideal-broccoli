class GroupHost < ApplicationRecord
  belongs_to :group, inverse_of: :group_hosts
  belongs_to :host, inverse_of: :group_hosts
end
