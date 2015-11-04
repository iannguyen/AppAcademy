class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true

  def self.in_bounds?(bounds)
    benches = Bench.all
    return benches if bounds.nil?
    benches = benches.select do |bench|
      bench.lat.between?(bounds[:south].to_f, bounds[:north].to_f) && bench.lng.between?(bounds[:west].to_f, bounds[:east].to_f)
      end
    benches
  end
end
