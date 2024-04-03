class Booking < ApplicationRecord
  validate :validate_start_time

  def calculate_total_time
    self.total_time = start_time + hours.hours
  end

  def status_label
    status ? 'Booked' : 'Pending'
  end

  private

  def validate_start_time
    if start_time && start_time < Time.current.beginning_of_day + 7.hours
      errors.add(:start_time, "should be after 7am")
    end
  end
end
