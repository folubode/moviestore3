class EmailJob < ApplicationJob
  queue_as :default

  def perform(email, body)
    FeedbacksMailer.mail_feedback(email, body).deliver
  end
end
