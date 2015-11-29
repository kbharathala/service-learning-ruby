class User < ActiveRecord::Base
  validates :password, presence: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :student_id, presence: true, uniqueness: true
  validates :graduatingyear, presence: true

  has_many :services, dependent: :destroy

  validate :capitalize

  def capitalize
    return if name.nil?
    errors.add(:name, 'is not capitalized') unless /[[:upper:]]/.match(name[0, 1])
  end
end
