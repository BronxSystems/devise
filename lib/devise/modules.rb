require 'active_support/core_ext/object/with_options'

Devise.with_options :model => true do |d|
  # Strategies first
  d.with_options :strategy => true do |s|
    routes = [nil, :new, :destroy]
    s.add_module :database_authenticatable
    s.add_module :token_authenticatable
    s.add_module :rememberable
  end

  # Other authentications
  d.add_module :encryptable

  # Misc after
  d.add_module :recoverable
  d.add_module :registerable
  d.add_module :validatable

  # The ones which can sign out after
  d.add_module :confirmable
  d.add_module :lockable
  d.add_module :timeoutable

  # Stats for last, so we make sure the user is really signed in
  d.add_module :trackable
end