require File.expand_path('helper', __dir__)

describe Sinatra::NamedRoute do
  it 'supports named routes' do
    mock_app do
      get '/', name: :index do
        uri(:index)
      end
    end

    get '/'
    assert_equal '/', last_response.body
  end

  it 'expands path by given params' do
    mock_app do
      get '/', name: :index do
        uri(:with_params, id: 1234, name: 'namusyaka')
      end
      
      get '/params/:id/names/:name', name: :with_params do
      end
    end

    get '/'
    assert_equal '/params/1234/names/namusyaka', last_response.body
  end
end
