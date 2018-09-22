require 'test_helper'

class NotaPorCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nota_por_curso = nota_por_cursos(:one)
  end

  test "should get index" do
    get nota_por_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_nota_por_curso_url
    assert_response :success
  end

  test "should create nota_por_curso" do
    assert_difference('NotaPorCurso.count') do
      post nota_por_cursos_url, params: { nota_por_curso: { curso_id: @nota_por_curso.curso_id, universidade_id: @nota_por_curso.universidade_id, media_alunos: @nota_por_curso.media_alunos, nota: @nota_por_curso.nota } }
    end

    assert_redirected_to nota_por_curso_url(NotaPorCurso.last)
  end

  test "should show nota_por_curso" do
    get nota_por_curso_url(@nota_por_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_nota_por_curso_url(@nota_por_curso)
    assert_response :success
  end

  test "should update nota_por_curso" do
    patch nota_por_curso_url(@nota_por_curso), params: { nota_por_curso: { curso_id: @nota_por_curso.curso_id, universidade_id: @nota_por_curso.universidade_id, media_alunos: @nota_por_curso.media_alunos, nota: @nota_por_curso.nota } }
    assert_redirected_to nota_por_curso_url(@nota_por_curso)
  end

  test "should destroy nota_por_curso" do
    assert_difference('NotaPorCurso.count', -1) do
      delete nota_por_curso_url(@nota_por_curso)
    end

    assert_redirected_to nota_por_cursos_url
  end
end
