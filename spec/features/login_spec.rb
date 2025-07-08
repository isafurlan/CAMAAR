require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  let!(:aluno) { Aluno.create!(email: 'aluno@unb.br', senha: '123456') }

  scenario 'Usuário faz login com sucesso' do
    visit new_session_path
    fill_in 'Email', with: 'aluno@unb.br'
    fill_in 'Senha', with: '123456'
    click_button 'Entrar'

    expect(page).to have_content('Página inicial do sistema')
  end

  scenario 'Login falha com senha incorreta' do
    visit new_session_path
    fill_in 'Email', with: 'aluno@unb.br'
    fill_in 'Senha', with: 'senha_errada'
    click_button 'Entrar'

    expect(page).to have_content('E-mail ou senha inválidos')
  end
end
