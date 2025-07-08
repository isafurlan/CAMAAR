require 'rails_helper'

RSpec.describe 'Aluno - Histórico de Formulários', type: :feature do
  let!(:aluno) { Aluno.create!(email: 'aluno@unb.br', senha: '123456') }

  before do
    login_as(aluno, scope: :aluno)
  end

  scenario 'Aluno visualiza formulários respondidos' do
    disciplina = Disciplina.create!(nome: 'Cálculo I')
    Resposta.create!(aluno: aluno, descricao: 'Gostei', disciplina: disciplina)

    visit historico_formularios_path
    expect(page).to have_content('Cálculo I')
  end

  scenario 'Aluno ainda não respondeu nenhum formulário' do
    visit historico_formularios_path
    expect(page).to have_content('Você ainda não respondeu nenhum formulário')
  end
end
