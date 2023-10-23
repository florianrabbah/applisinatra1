class Gossip < ActiveRecord::Base

  validates :author, presence: true
  validates :content, presence: true

  def self.latest_gossips(limit)
    order(created_at: :desc).limit(limit)
  end

  

end