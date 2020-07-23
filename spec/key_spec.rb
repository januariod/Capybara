# frozen_string_literal: true

describe 'Teclado', :key do
  before(:each) do
    visit '/key_presses'
  end

  it 'enviando teclas' do
    teclas = %i[tab escape space enter shift control alt]
    teclas.each do |t|
      find('#campo-id').send_keys t
      expect(page).to have_content 'You entered: ' + t.to_s.upcase
    end
  end

  it 'enviando letras' do
    letras = %w[a b c d e f g h i j k l m n o p q r s t u v x z]
    letras.each do |l|
      find('#campo-id').send_keys l
      expect(page).to have_content 'You entered: ' + l.upcase
    end
  end
end
