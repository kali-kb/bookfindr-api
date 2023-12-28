# app/views/books/index.json.jbuilder
json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.cover book.cover
  json.author book.author
  json.download_link book.download_link

  # Add the custom attribute is_saved
  json.is_saved book.is_saved(@user_id) #custom attribute
end

