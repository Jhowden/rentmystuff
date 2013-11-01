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

end
