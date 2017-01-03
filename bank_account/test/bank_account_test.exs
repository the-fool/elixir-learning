defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount

  test "start at 0" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is 0, account
  end

  test "has balance incremented by the amount" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit, 10})
    verify_balance_is 10, account
  end
  test "has balance decremented by amount of withdrawal" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit, 20})
    send(account, {:withdraw, 10})
    verify_balance_is 10, account 
  end
  def verify_balance_is(expected_balance, account) do
    send(account, {:check_balance, self})
    assert_receive {:balance, ^expected_balance}
  end
end
