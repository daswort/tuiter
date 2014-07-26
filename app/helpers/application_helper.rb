module ApplicationHelper

  # Retorna la etiqueta <title> con su respectivo contenido "{titulo sitio} | {titulo pagina}"
  def full_title(page_title)
    base_title = "Tuiter"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
