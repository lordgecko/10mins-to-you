require 'spec_helper'

describe "User pages" do

  subject { page }
  
  describe 'upload page' do
    before { visit root_path }
    
    it { should have_selector('h1',    text: 'Upload') }
    
     describe "without file specified" do
      it "should not upload anything" do
        page { should have_selector('div', text: 'No file selected') }
      end
    end
  end
end
