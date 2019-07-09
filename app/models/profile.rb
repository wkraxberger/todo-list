class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w{male female}, message: "%{value} is not a valid gender" }
  validate :first_or_last_name_present
  validate :check_gender_name

  def first_or_last_name_present
    if first_name.nil? and last_name.nil?
      errors.add(:first_name,"Need to provide first or last name")
    end
  end

  def check_gender_name
    if gender=="male" and first_name=="Sue"
      errors.add(:gender,"Sue is not a man!")
    end
  end

  def self.get_all_profiles(min_year,max_year)
    Profile.where("birth_year BETWEEN ? and ?", min_year, max_year).order(birth_year: :asc)
  end
end
