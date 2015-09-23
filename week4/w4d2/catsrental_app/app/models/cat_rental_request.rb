# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  RENTAL_STATUS = ['PENDING', 'APPROVED', 'DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: RENTAL_STATUS,
    message: "Unauthorized rental status." }
  validate :no_overlapping_approvals

  belongs_to(
    :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id
  )

  def approve!
    begin
      #Make sure you throw an error with transaction or it will continue through to it's end
    CatRentalRequest.transaction do
      self.update!(status: "APPROVED")
      overlap = overlapping_requests
      overlap.each do |overlap_reservation|
        overlap_reservation.deny!
      end
    end
    rescue ActiveRecord::RecordInvalid
      false
    end
  end

  def deny!
    self.update(status: "DENIED")
  end

  def pending?
    self.status == "PENDING"
  end

  # private
  def overlapping_requests
    CatRentalRequest
    .where(<<-SQL, self.end_date, self.start_date, self.id, self.cat_id)
      cat_rental_requests.start_date < ?
      AND cat_rental_requests.end_date > ?
      AND cat_rental_requests.id != ?
      AND cat_id = ?
    SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where("cat_rental_requests.status = ?", 'APPROVED' )
  end

  def no_overlapping_approvals
    if self.status == "APPROVED" && !overlapping_approved_requests.empty?
      errors.add(:status, "Cannot approve rental request.")
    end
  end
end
