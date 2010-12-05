# coding: utf-8

# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural "товар", "товары"
  inflect.plural "цвет", "цвета"
  inflect.plural "вид одежды", "виды одежды"  
  inflect.plural "контакт", "контакты"
  inflect.plural "сообщение", "сообщения"
  inflect.plural "заказ", "заказы"
  inflect.plural "фотография", "фотографии"
  inflect.plural "сезон", "сезоны"
  inflect.plural "размер одежды", "размеры одежды"
  inflect.plural "пользователь", "пользователи"
  inflect.uncountable "Назад в магазин"
  inflect.uncountable "Форум"  

  inflect.plural "Товар", "Товары"
  inflect.plural "Цвет", "Цвета"
  inflect.plural "Вид одежды", "Виды одежды"  
  inflect.plural "Контакт", "Контакты"
  inflect.plural "Сообщение", "Сообщения"
  inflect.plural "Заказ", "Заказы"
  inflect.plural "Фотография", "Фотографии"
  inflect.plural "Сезон", "Сезоны"
  inflect.plural "Размер одежды", "Размеры одежды"
  inflect.plural "Пользователь", "Пользователи"  
  
end