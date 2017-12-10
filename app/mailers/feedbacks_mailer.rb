class FeedbacksMailer < ApplicationMailer
  default to: 'feedbacks@moviestore.com'
  default from: 'noreply@moviestore.com'

  def mail_feedback(email, body)
    @email = email
    @body = body
    mail subject: :feedback
  end
end
