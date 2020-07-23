# frozen_string_literal: true

describe 'nova janela', :window do
  before(:each) do
    visit '/windows'
  end

  it 'nova janela' do
    new_window = window_opened_by { click_link 'Clique aqui' }
    within_window -> { page.title == 'Nova Janela' } do
      expect(page).to have_content 'Aqui temos uma nova janela \o/'
    end
    new_window.close
    expect(new_window.closed?).to be true
  end
end
