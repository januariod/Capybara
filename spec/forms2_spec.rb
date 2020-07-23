# frozen_string_literal: true

describe 'forms 2', :login2 do
  before(:each) do
    visit '/login'
  end

  it 'com data de nascimento' do
    fill_in 'userId', with: 'stark'
    fill_in 'passId', with: 'jarvis!'

    login_form = find('#login')

    case login_form.text
    when /Dia/
      find('#day'). set '29'
    when /Mês/
      find('#month').set '05'
    when /Ano/
      find('#year').set '1970'
    end

    click_button 'Login'
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
  end
end
