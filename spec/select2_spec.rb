# frozen_string_literal: true

describe 'Select2', :select2 do
  describe('single', :single) do
    before(:each) do
      visit '/apps/select2/single.html'
    end

    it 'seleciona ator por nome' do
      find('.select2-selection--single').click
      find('.select2-results__option', text: 'Adam Sandler').click
    end

    it 'seleciona por busca e click' do
      find('.select2-selection--single').click
      find('.select2-search__field').set 'Chris Rock'
      find('.select2-results__option').click
    end
  end

  describe('multiple', :multi) do
    before(:each) do
      visit '/apps/select2/multi.html'
    end

    def selecione(ator)
      find('.select2-selection--multiple').click
      find('.select2-search__field').set ator
      find('.select2-results__option').click
    end

    it 'seleciona atores' do
      atores = ['Jim Carrey', 'Kevin James', 'Adam Sandler']
      atores.each do |a|
        selecione(a)
      end
    end
  end
end
