class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true

  after_commit { MessageJob.perform_later(self) }
end
