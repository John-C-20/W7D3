require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it 'should allow new users to sign-up' do
            get :new
            expect(response).to render_template(:new)
        end
    end

    # describe 'POST #create' do 
    #     it 'should create a new user from form info from :new' do 
        
    
    describe 'GET #index' do
        it 'should render the users index' do 
            get :index
            expect(response).to render_template(:index) 
        end
    end

    describe 'GET #show' do
        subject (:test_user) { User.create(name: 'Raytwo', password: 'ajkafjksfkj') }
        
        it 'should render the information for a specific user' do 
            get :show, params: {id: test_user.id}
            fetched_user = controller.instance_variable_get(:@user)
            expect(fetched_user).to eq(User.find(test_user.id))
            expect(response).to render_template(:show)
        end
    end
end


# describe "DELETE #destroy" do
#         let!(:test_chirp) { create(:chirp) }
#         before :each do
#             delete :destroy, params: { id: test_chirp.id }
#         end
        
#         it "destroys the chirp" do
#             # delete :destroy, params: { id: test_chirp.id }
#             expect(Chirp.exists?(test_chirp.id)).to be false
#         end
#         it "redirects to chirps_url" do
#             # delete :destroy, params: { id: test_chirp.id }
#             expect(response).to redirect_to(chirps_url)
#         end
#     end




#should be able to sign up a new user #new, #create 
#should be able to show all users #index
#should be able to show information for a specific user #show 

#should be able to login an existing user #logged_in? 
#should be able to logout an existing user (based on session_tokens/cookies)

