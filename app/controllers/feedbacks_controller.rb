class FeedbacksController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if params[:feedback][:thumbs_up] == "up"
      thumbs_up = true
    else
      thumbs_up = false
    end
    @feedback = Feedback.new(comment: params[:feedback][:comment],
                             giver_id: current_user.id,
                             thumbs_up: thumbs_up)

    if @feedback.save
      @item.received_feedbacks << @feedback
      if request.xhr?
        render @feedback
      else
        redirect_to item_path(@item)
      end
    else
      redirect_to item_path(@item)
    end
  end
end
