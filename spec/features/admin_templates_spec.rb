require 'rails_helper'

RSpec.describe 'Admin - Templates', type: :feature do
  let!(:admin) { Administrador.create!(email: 'admin@unb.br', senha: 'admin123') }
  let!(:disciplina) { Disciplina.create!(nome: 'Banco de Dados') }

  before do
    login_as(admin, scope: :administrador)
  end

  scenario 'Administrador cria template com perguntas' do
    visit new_template_path
    select 'Banco de Dados', from: 'Disciplina'
    fill_in 'Pergunta 1', with: 'Como você avalia o conteúdo?'
    click_button 'Salvar'

    expect(page).to have_content('Template criado com sucesso')
  end

  scenario 'Administrador tenta criar template vazio' do
    visit new_template_path
    select 'Banco de Dados', from: 'Disciplina'
    click_button 'Salvar'

    expect(page).to have_content('Adicione pelo menos uma pergunta antes de salvar')
  end
end
