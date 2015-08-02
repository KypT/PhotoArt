module ApplicationHelper
  def page_title
    @page_title || 'Всеволод Тоботрас. Художественная фотография'
  end

  def page_keywords
    @page_keywords || 'фото, фотография, художественная, фотошкола, фототур, фотоэкспедиция, обучение'
  end

  def page_description
    @page_description || 'Всеволод Тоботрас - профессиональная художественная фотография.
      Организация фотоэкспедиций и фототуров. Фотосъемка в студии, обучение художественной фотографии.'
  end

  def count_messages(entity_type, id)
    @discussion = Discussion.find_by about: entity_type, entity_id: id
  end
end
