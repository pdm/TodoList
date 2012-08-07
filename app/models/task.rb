class Task < ActiveRecord::Base
  validates :content, :presence => true, :length => {:minimum => 3}

  before_save :format_content

  class << self
    def old_tasks
      where("created_at <= ?", Time.now - 1.hour)
    end
  end

  def format_content
    content.capitalize!
  end
end
