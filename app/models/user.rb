class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    from_slug = slug.gsub!(/[-]/, " ")
    self.find_by(username: from_slug)
  end

end
