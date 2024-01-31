json.set! :new_url, new_api_v1_pin_url

json.set! :pins do
  json.array! @pins, partial: "api/v1/pins/pin", as: :pin
end
