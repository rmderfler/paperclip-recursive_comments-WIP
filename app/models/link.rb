class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :user
  has_many :votes
  has_many :comments, as: :commentable
  has_many :photos, as: :photoable
  attr_accessor :total_points

  def total_points
    time = Time.now
    time = time.to_s.slice(-2,2)
    count = self.votes.count * 10
    time_created = time.to_i - self.created_at.to_i
    total = count + time_created
  end

  def self.sort_by_points
    self.all.sort { |a,b| a.total_points <=> b.total_points }
  end
end
