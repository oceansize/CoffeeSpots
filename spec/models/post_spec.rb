
describe Post do

	it 'can be created' do
		title, content ='Test Post', 'test content'
		expect(Post.new(title: title, content: content).valid?).to eq true
	end

	it 'can be saved in the database' do
		expect(Post.count).to eq 0
		create_post
		expect(Post.count).to eq 1
	end

	it 'can be retrieved from he database' do
		create_post
		expect(Post.first.title).to eq 'Test Post'
	end

	it 'can be removed from the database' do
		create_post
		Post.first.destroy
		expect(Post.count).to eq 0
	end	

	it 'can have content' do
		create_post
		expect(Post.first.content).to eq 'test content'
	end	
	
end


def create_post (title = 'Test Post', content = 'test content') 
	Post.create(title: 'Test Post', content: 'test content') 
end


