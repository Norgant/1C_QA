﻿#language: ru
@ExportScenarios
@IgnoreONCIMainBuild
@tree

Функционал: Заполнение шапки документа заказ

Как Менеджер по продажам я хочу
Заполнить шапку документа заказ 
чтобы протестировать бизнес-процесс продажи 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

@Типшага: ЗаполнениеТестовыхДанных
@Описание: Заполняем шапку документа заказ
@ПримерИспользования: И Заполнение шапки заказа
Сценарий: Заполнение шапки заказа
* Заполненение шапки
	Когда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'           |
		| '000000016' | 'Магазин "Мясная лавка"' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'

* Проверка заполнения шапки
	И элемент формы 'Организация' стал равен 'ООО "1000 мелочей"'
	И элемент формы 'Покупатель' стал равен 'Магазин "Мясная лавка"'
	И элемент формы 'Склад' стал равен 'Склад отдела продаж'