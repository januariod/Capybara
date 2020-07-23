# frozen_string_literal: true

describe 'Mouse hover', :hover do
  before(:each) do
    visit 'hovers'
  end

  it 'quando passo o mouse sobre o Blade' do
    card = find('img[alt=Blade]')
    card.hover

    expect(page).to have_content 'Nome: Blade'
  end

  it 'quando passo o mouse sobre o Pantera Negra' do
    card = find('img[alt^=Pantera]')
    card.hover

    expect(page).to have_content 'Nome: Pantera Negra'
  end

  it 'quando passo o mouse sobre o Homem Aranha' do
    card = find('img[alt$=Aranha]')
    # ou contain ('img[alt*=Aranha]')
    card.hover

    expect(page).to have_content 'Nome: Homem Aranha'
  end
end
