class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.from_omniauth(account, response)
    account_type = account
    account_type.constantize.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |p|
      p.email = response[:info][:email]
      p.username = response[:info][:name]
      p.password = SecureRandom.hex(15)
    end
  end
end
