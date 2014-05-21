require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  setup do
    @poll = polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post :create, poll: { player1: @poll.player1, player2: @poll.player2, tiebreaker: @poll.tiebreaker, tier1_team1: @poll.tier1_team1, tier1_team2: @poll.tier1_team2, tier2_team1: @poll.tier2_team1, tier2_team2: @poll.tier2_team2, tier3_team1: @poll.tier3_team1, tier3_team2: @poll.tier3_team2, tier4_team1: @poll.tier4_team1, tier4_team2: @poll.tier4_team2, user_id: @poll.user_id }
    end

    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should show poll" do
    get :show, id: @poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll
    assert_response :success
  end

  test "should update poll" do
    patch :update, id: @poll, poll: { player1: @poll.player1, player2: @poll.player2, tiebreaker: @poll.tiebreaker, tier1_team1: @poll.tier1_team1, tier1_team2: @poll.tier1_team2, tier2_team1: @poll.tier2_team1, tier2_team2: @poll.tier2_team2, tier3_team1: @poll.tier3_team1, tier3_team2: @poll.tier3_team2, tier4_team1: @poll.tier4_team1, tier4_team2: @poll.tier4_team2, user_id: @poll.user_id }
    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete :destroy, id: @poll
    end

    assert_redirected_to polls_path
  end
end
