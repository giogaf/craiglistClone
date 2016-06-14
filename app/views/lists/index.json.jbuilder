json.array!(@lists) do |list|
  json.extract! list, :id, :titulo, :descripcion, :category_id, :subcategory_id
  json.url list_url(list, format: :json)
end
