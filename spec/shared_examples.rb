shared_examples_for 'it has many' do |target, included_item|
	before { subject.send("#{target}") <<  included_item}
	
	its(target) { should be_a Array}

    its(target) { should include included_item } 
end