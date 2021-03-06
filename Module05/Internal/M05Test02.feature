#language: ru

@tree

Функционал: Заполнение документа Заказ Покупателя

Как Тестировщик я хочу
Проверить заполнение поля Организация в документе Заказа покупателя
чтобы протеситровать бизнес-процесс продажи

Контекст:
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовительный
* Загружаю тестовые данные
	И экспорт основных данных

Сценарий: Тестирование Заказа покупателя
* Создаю новый заказ покупателя
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
* Выбираю соглашение
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Вид'     | 'Вид взаиморасчетов'         | 'Код' | 'Наименование'                                         |
		| 'Обычное' | 'По стандартным соглашениям' | '5'   | 'Общее соглашение (расчет по стандартным соглашениям)' |	
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
* Заполнение поля Организация
	Если элемент формы 'Организация' стал равен 'Собственная компания 1' Тогда
	Иначе		
		И я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'           |
			| '1'   | 'Собственная компания 1' |
		И я нажимаю на кнопку с именем 'FormChoose'										