require 'spec_helper'

describe InfluencersController, type: :controller do
  describe "GET show" do
    let(:influencer) { Influencer.new }

    before do
      allow(Influencer).to receive(:find).with("1").and_return(influencer)
    end

    context "when the influencer is archived" do
      before do
        influencer.stub(:archived?).and_return(true)
      end

      context "and the user is logged in" do
        let(:user) { User.new }

        before do
          subject.stub(:cas_user).and_return({'user' => 'nicolas@meurio.org.br'})
          User.stub(:find_by_email).and_return(user)
        end

        context "and can edit influencers" do
          before do
            user.admin = true
            get :show, id: 1
          end

          it { should respond_with(200) }
        end
      end
    end
  end
end
