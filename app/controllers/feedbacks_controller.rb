class FeedbacksController < ApplicationController

  def create
    @email = params[:email]
    @content = params[:content]

    EmailJob.perform_now(@email, @content)

    flash[:notice] = 'Successfully Sent Feedback'
    redirect_to root_path
  end
end
