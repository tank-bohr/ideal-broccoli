hardwareness = Group.create!(name: :hardwareness, kind: :attribute)
environment = Group.create!(name: :environment, kind: :attribute)
virtualization_type = Group.create!(name: :virtualization_type, kind: :attribute)
consul_role = Group.create!(name: :consul_role, kind: :attribute)

hardware = Group.create!(name: :hardware, kind: :value)
virtual = Group.create!(name: :virtual, kind: :value)

production = Group.create!(name: :production, kind: :value)
staging = Group.create!(name: :staging, kind: :value)

kvm = Group.create!(name: :kvm, kind: :value)
lxc = Group.create!(name: :lxc, kind: :value)

consul_server = Group.create!(name: :consul_server, kind: :value)
consul_agent = Group.create!(name: :consul_agent, kind: :value)

consul = Group.create!(name: :consul, kind: :tag)

Group.create!([
  { name: :kafka, kind: :tag },
  { name: :mysql, kind: :tag }
])

Restriction.create!([
  {
    group: hardwareness,
    kind: :required,
    dependent_group: nil
  },
  {
    group: environment,
    kind: :required,
    dependent_group: nil
  },
  {
    group: hardware,
    kind: :value_of,
    dependent_group: hardwareness
  },
  {
    group: virtual,
    kind: :value_of,
    dependent_group: hardwareness
  },
  {
    group: production,
    kind: :value_of,
    dependent_group: environment
  },
  {
    group: staging,
    kind: :value_of,
    dependent_group: environment
  },
  {
    group: kvm,
    kind: :value_of,
    dependent_group: virtualization_type
  },
  {
    group: lxc,
    kind: :value_of,
    dependent_group: virtualization_type
  },
  {
    group: consul_agent,
    kind: :value_of,
    dependent_group: consul_role
  },
  {
    group: consul_server,
    kind: :value_of,
    dependent_group: consul_role
  },
  {
    group: consul,
    kind: :requires,
    dependent_group: consul_role
  }
])
