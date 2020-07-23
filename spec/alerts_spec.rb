# frozen_string_literal: true

describe 'Alertas de JS', :alerts do
  before(:each) do
    visit '/javascript_alerts'
  end

  it 'alerta' do
    click_button 'Alerta'

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Isto é uma mensagem de alerta'
  end

  it 'confirma' do
    click_button 'Confirma'
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Mensagem confirmada'
  end

  it 'não confirma' do
    click_button 'Confirma'
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content 'Mensagem não confirmada'
  end

  it 'prompt', :prompt do
    accept_prompt(with: 'Daniel') do
      click_button 'Prompt'
      sleep 1
    end
    expect(page).to have_content 'Olá, Daniel'
  end

  it 'prompt negado', :negado do
    dismiss_prompt do
      click_button 'Prompt'
      sleep 2
    end
    expect(page).to have_content 'Olá, null'
  end
end
