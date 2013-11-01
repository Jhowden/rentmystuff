describe Borrowing do

  subject(:borrwing) { create(:borrowing) }

  it_behaves_like 'it has many', :dates, Date.new

  its(:status) { should eq 'pending' }

end
