﻿#language: ru

@tree

Функционал:  Формирование отчета D2001 Продажи

Как Тестировщик я хочу
протестировать отображение возвратов в отчете D2001 Продажи
чтобы отчет по продажам содержал корректные данные 

Контекст:
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий	
	

Сценарий: Подготовительный
* Загружаю тестовые данные


	И экспорт основных данных
	И Экспорт документов для отчета D2001 Продажи

Сценарий: Проведение загруженных документов	
	И я выполняю код встроенного языка на сервере
	|'Documents.SalesReturn.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting)'|

Сценарий: Проверка отчета
* Формирую отчет
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R2C1" в течение 20 секунд
* Проверяю результат отчета
	Дано Табличный документ "Result" равен макету "МакетОтчетаПоПродажам"
	
		
	