﻿#language: ru

@tree

Функционал: Проверка прикрепления файлов

Как Тестировщик я хочу
проверить возможность присоединения картинок к справочнику "Товары"
чтобы пользователь мог визуально просмотреть товар

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий 

Сценарий: Открытие элемента справочника
* Загрузка основных данных
	И Загрузка констатнт
	И Загрузка справочников
* Открытие элемента справочника
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'	
	Когда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000099' | 'Молочные'     |
	И в таблице  "Список" я перехожу на один уровень вниз		
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000035' | 'Йогурт'       |
	И в таблице "Список" я выбираю текущую строку
* Загрузка файла
	Тогда открылось окно 'Йогурт (Товар)'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
	И я нажимаю на кнопку с именем 'ЗагрузитьФайлы'
	Тогда открылось окно 'Форма загрузки файлов'	
	И я выбираю файл "$КаталогПроекта$\Image.bmp"	
	И в таблице "СписокФайлов" я нажимаю на кнопку с именем 'ДобавитьФайлы'
	И я нажимаю на кнопку с именем 'Загрузить'
* Проверка присоединения файла
	Тогда открылось окно 'Йогурт (Товар)'
	Тогда таблица "Список" стала равной:
		| 'Наименование' |
		| 'Image.bmp'    |

И я закрываю все окна клиентского приложения		