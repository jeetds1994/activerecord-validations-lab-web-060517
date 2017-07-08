class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 250}
  validates :category, inclusion: %w(Fiction Non-fiction)
  before_validation :check_title

  def check_title
    return false if self.title.nil?
    answer = false
    arr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    arr.each {|title| answer = true if self.title.include?(title)}
    answer
  end

end
