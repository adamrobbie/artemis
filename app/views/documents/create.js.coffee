$('<%= content_tag_for :li, @document do %>
          <%= render @document %>
        <% end %>')
  .prependTo('#documents')
  .hide()
  .fadeIn()
$('#new_document')[0].reset()