json.user do
  json.name @user.name
  json.email @user.email
  json.token @user.authentication_token
  json.id @user.id

  json.classes @user.parent_classes do |schoolClass|
  json.id schoolClass.id
  json.name schoolClass.name
  json.school schoolClass.school.name
  end
end
  