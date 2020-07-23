# frozen_string_literal: true

describe 'Dynamic control', :dc do
  before(:each) do
    visit '/dynamic_controls'
  end

  it 'quando habilita o campo' do
    res = page.has_field? 'movie', disabled: true

    click_button 'Habilita'
    res = page.has_field? 'movie', disabled: false
  end
end
