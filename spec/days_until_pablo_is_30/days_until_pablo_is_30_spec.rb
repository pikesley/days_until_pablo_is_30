module DaysUntilPabloIs30
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    Timecop.freeze DateTime.parse '2018-02-16T12:00:00' do
      it 'serves HTML' do
        get '/'
        expect(last_response).to be_ok
        expect(last_response.body).to match /159/
      end

      it 'serves JSON' do
        get '/', nil, JSON_HEADERS
        expect(last_response).to be_ok
        expect(JSON.parse last_response.body).to eq (
          {
            'days' => 159
          }
        )
      end
    end
  end
end
