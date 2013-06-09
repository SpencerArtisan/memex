require 'spec_helper'

describe MemoriesController do
  describe 'home page' do
    it 'should serve up html' do
      get :index, format: :text
      response.body.should render_template :index
    end
  end
end
