require 'rails_helper'

RSpec.describe 'Admin - Visualizar Respostas', type: :feature do
  let!(:admin) { Administrador.create!(email: 'admin@unb.br', senha: 'admin123') }
  let!(:disciplina) { Disciplina.create!(nome: 'Engenharia de Software') }
  let!(:resposta) { Resposta.create!(descricao: 'Gostei da matéria', disciplina: disciplina) }

  before do
    login_as(admin, scope: :administrador)
  end

  scenario 'Admin visualiza respostas com sucesso' do
    visit admin_respostas_path
    select 'Engenharia de Software', from: 'Disciplina'
    click_button 'Ver Respostas'

    expect(page).to have_content('Gostei da matéria')
  end

  scenario 'Admin tenta visualizar formulário sem resposta' do
    disciplina2 = Disciplina.create!(nome: 'Banco de Dados')
    visit admin_respostas_path
    select 'Banco de Dados', from: 'Disciplina'
    click_button 'Ver Respostas'

    expect(page).to have_content('Nenhuma resposta registrada até o momento')
  end
end
