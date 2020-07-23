# frozen_string_literal: true

describe 'forms 3', :login3 do
  before(:each) do
    visit '/access'
  end

  it 'com sucesso' do
    within('#login') do
      find('input[name="username"]').set 'stark'
      find('input[name="password"]').set 'jarvis!'
      click_button 'Entrar'
    end
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
  end

  it 'cadastro' do
    within('#signup') do
      find('input[name="username"]').set 'daniel'
      find('input[name="password"]').set '1234567891011121314151617181202122232'
      click_link 'Criar Conta'
    end
    expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
  end
end
