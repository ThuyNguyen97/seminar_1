class User < ApplicationRecord

  # scope :created_in, -> { where "DATE(?) = DATE(created_at)", Time.current }
  scope :created_in_today, -> { where created_at: Time.current.beginning_of_day..Time.current.end_of_day }

  def self.populate
    24.times do |hour|
      self.create created_at: Time.now.change(hour: hour)
    end
  end
end
