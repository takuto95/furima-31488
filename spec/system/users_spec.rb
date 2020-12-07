require 'rails_helper'
require 'date'

RSpec.describe "Users", type: :system do
before do
  @user = FactoryBot.build(:user)
end

context 'ユーザが新規登録できるとき' do
  it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する.また正しいボタンが存在する' do
    #トップページへ移動する
    visit root_path
    #トップページに新規登録ボタンがあることを確認する
    expect(page).to have_content('新規登録')
    #トップページにログインボタンがある事を確認する
    expect(page).to have_content('ログイン')
    #ログインページへ遷移できるか確認する
    visit new_user_session_path
    #トップページに戻る
    visit root_path
    #新規登録ページへ移動する
    visit new_user_registration_path
    #ユーザー情報を入力する
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.name_first
    fill_in 'first-name', with: @user.name_last
    fill_in 'last-name-kana', with: @user.name_reading_first
    fill_in 'first-name-kana', with: @user.name_reading_last
    find("select[id='user_birthday_1i']").find("option[value='1950']").select_option
    find("select[id='user_birthday_2i']").find("option[value='10']").select_option
    find("select[id='user_birthday_3i']").find("option[value='23']").select_option
    #サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change {User.count}.by(1)
    #トップページへ移動する
    expect(current_path).to eq root_path
    #トップページにニックネーム、ログアウトが表示されていること
    expect(page).to have_content(@user.nickname)
    expect(page).to have_content('ログアウト')
    #サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end
end

context 'ユーザー新規登録ができないとき' do
  it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
    #トップページへ移動する
    visit root_path
    #トップページに新規登録ボタンがあることを確認する
    expect(page).to have_content('新規登録')
    #トップページにログインボタンがある事を確認する
    expect(page).to have_content('ログイン')
    #ログインページへ遷移できるか確認する
    visit new_user_session_path
    #トップページに戻る
    visit root_path
    #新規登録ページへ移動する
    visit new_user_registration_path
    #ユーザー情報を入力する
    fill_in 'nickname', with: ""
    fill_in 'email', with: ""
    fill_in 'password', with: ""
    fill_in 'password-confirmation', with: ""
    fill_in 'last-name', with: ""
    fill_in 'first-name', with: ""
    fill_in 'last-name-kana', with: ""
    fill_in 'first-name-kana', with: ""
    find("select[id='user_birthday_1i']").find("option[value='1950']").select_option
    find("select[id='user_birthday_2i']").find("option[value='10']").select_option
    find("select[id='user_birthday_3i']").find("option[value='23']").select_option
    #サインアップボタンを押してもユーザーモデルのカウントは上がらない事を確認する
    expect{
      find('input[name="commit"]').click
    }.to change {User.count}.by(0)
  end

end

end
