class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.name = 'ゲスト'
      user.profile = '宜しく'
      user.occupation = 'テック'
      user.position = '社長'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーログイン'
  end
end