﻿#language: ru

@tree

Функционал: Проверка расчета суммы документа "Заказ" при изменении количества и цены

Как Менеджер по продажам я хочу
проверить что сумма заказа пересчитывается при изменении количества и цены
чтобы процесс продажи происходил корректно 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка расчета суммы заказа
И я закрываю все окна клиентского приложения
* Создадим новый документ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Добавим строку с номенклатурой
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
* Вводим первочанальую цену
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '550,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я завершаю редактирование строки
* Проверка расчета первоначальной цены
	Тогда элемент формы 'Сумма (итог)' стал равен '550'
* Изменяем количество
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка расчета суммы после изменения количества
	Тогда элемент формы 'Сумма (итог)' стал равен '5 500'
* Изменяем цену
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '20,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка расчета суммы после изменения цены
	Тогда элемент формы 'Сумма (итог)' стал равен '200'