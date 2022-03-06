require "test_helper"

class SecTodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sec_todo = sec_todos(:one)
  end

  test "should get index" do
    get sec_todos_url, as: :json
    assert_response :success
  end

  test "should create sec_todo" do
    assert_difference("SecTodo.count") do
      post sec_todos_url, params: { sec_todo: { completed: @sec_todo.completed, itemclass: @sec_todo.itemclass, note: @sec_todo.note, title: @sec_todo.title, todo_id_id: @sec_todo.todo_id_id } }, as: :json
    end

    assert_response :created
  end

  test "should show sec_todo" do
    get sec_todo_url(@sec_todo), as: :json
    assert_response :success
  end

  test "should update sec_todo" do
    patch sec_todo_url(@sec_todo), params: { sec_todo: { completed: @sec_todo.completed, itemclass: @sec_todo.itemclass, note: @sec_todo.note, title: @sec_todo.title, todo_id_id: @sec_todo.todo_id_id } }, as: :json
    assert_response :success
  end

  test "should destroy sec_todo" do
    assert_difference("SecTodo.count", -1) do
      delete sec_todo_url(@sec_todo), as: :json
    end

    assert_response :no_content
  end
end
