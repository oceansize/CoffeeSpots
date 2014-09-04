
describe 'form for creating Posts' do
 
    it 'can create a new post' do
       	visit 'posts/new'
        fill_in 'Title', with: 'Test_Post'
        fill_in 'Content', with: 'Test_Content'
        click_button 'Create'
        expect(current_path).to eq posts_path
        expect(page).to have_content 'Test_Post'
        expect(page).to have_content 'Test_Content'
    end
end
