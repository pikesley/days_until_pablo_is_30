module DaysUntilPabloIs30
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'serves HTML' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match /remaining until/
      expect(last_response.body).to match /Pablo is 30/
    end

    it 'serves JSON' do
      get '/', nil, JSON_HEADERS
      expect(last_response).to be_ok
      expect(JSON.parse last_response.body).to be_a Hash
    end
  end
end
