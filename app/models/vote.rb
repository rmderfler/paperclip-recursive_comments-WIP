class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  def self.user_not_voted(user, link)
    self.where(user_id: user.id, link_id: link.id).count == 0
  end
end
