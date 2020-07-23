describe 'Caixa de opção', :dropdown do
  # metodo exclusivo para dropdown by id
  it 'item especifico simples' do
    visit '/dropdown'
    # dropdown é o id do elemento
    select('Loki', from: 'dropdown')
  end

  # metodo usado com find
  it 'item especifico find' do
    visit 'dropdown'
    drop = find('.avenger-list')
    drop.find('option', text: 'Scott Lang').select_option
  end

  it 'qualquer item, aleatório', :sample do
    visit 'dropdown'
    drop = find('.avenger-list')
    drop.all('option').sample.select_option
    sleep 2
  end
end
