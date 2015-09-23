class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64(16)
    end
    code
  end
end
