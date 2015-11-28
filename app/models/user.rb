class User < ActiveRecord::Base
  validates :password, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  validate :capitalize

  def capitalize
    return if name.nil?
    errors.add(:name, 'name is not capitalized') unless /[[:upper:]]/.match(name[0, 1])
  end
end
