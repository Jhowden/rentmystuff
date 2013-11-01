class BorrowingsController < ApplicationController
  def accepted
    @borrowing = Borrowing.find(params[:id])
    @item = @borrowing.item
    @borrower = @item.borrower
    @lender = @item.lender
    @borrowing.update_attributes(:status => 'accepted')
    @lender.send_message(@borrower, "#{@lender.first_name} has accepted your offer to borrow #{@item.title}", "Request Accepted!")
    @item.update_attributes(available: false)


    redirect_to root_path
  end

  def decline
    @borrowing = Borrowing.find(params[:id])
    @item = @borrowing.item
    @borrowing.update_attributes(:status => 'declined')
    
    @lender = @item.lender
    @borrower = @item.borrower
    @lender.send_message(@borrower, "#{@lender.first_name} has decline your offer to borrow #{@item.title}", "Request Rejected") 
    redirect_to root_path
  end

  def create
    @item = Item.find(params[:item_id])
    @borrowing = Borrowing.new(user_id: current_user.id,
                               item_id: @item.id)
    if @borrowing.save!
      current_user.send_message(@item.lender, "#{current_user.first_name} wants to borrow your #{@item.title}. Go to your dashboard to accept or decline", "Pending Request")
      redirect_to items_path
    else
      render item_path(@item)
    end
  end

end
