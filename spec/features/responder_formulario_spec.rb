require 'rails_helper'

RSpec.describe 'Responder Formulário', type: :feature do
  let!(:aluno) { Aluno.create!(email: 'aluno@unb.br', senha: '123456') }
  let!(:formulario) { Formulario.create!(titulo: 'Engenharia de Software', ativo: true) }

  before do
    login_as(aluno, scope: :aluno)
  end

  scenario 'Usuário responde formulário com sucesso' do
    visit formularios_path
    click_link 'Engenharia de Software'

    fill_in 'Resposta[pergunta_1]', with: 'Ótima disciplina'
    click_button 'Enviar'

    expect(page).to have_content('Resposta registrada com sucesso')
  end

  scenario 'Usuário tenta acessar formulário não disponível' do
    formulario.update(ativo: false)
    visit formularios_path

    expect(page).to have_content('Nenhum formulário disponível no momento')
  end
end
