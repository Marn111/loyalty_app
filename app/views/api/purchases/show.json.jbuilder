json.purchase do
  json.partial! 'api/purchases/purchase', purchase: @purchase
end
