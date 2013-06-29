json.array!(@memories) do |memory|
  json.extract! memory, :description, :priority
  json.url memory_url(memory, format: :json)
end
