def json_body
  JSON.parse(response.body, symbolize_names: true)
end

def user_headers(user)
  post('/user/sign_in', params: { email: user.email, password: user.password }).to_json

  {
    "access-token": response.headers["access-token"],
    "token-type": response.headers["token-type"],
    "client": response.headers["client"],
    "expiry": response.headers["expiry"],
    "uid": response.headers["uid"],
    "authorization": response.headers["authorization"]
  }
end