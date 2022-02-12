#language: ru

@tree

Функционал: Заполнение справочника в цикле

Как Тестировщик я хочу
Заполнить тестовыми данными справочник Номенклатура
чтобы использовать его в дальнейших тестах

Контекст:
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий	

Сценарий: Подготовительный
* Загружаю тестовые данные
	И экспорт основных данных

Сценарий: Создание номенклатуры
	И Я запоминаю в переменную "Шаг" значение 1
	И я делаю 10 раз
		И Я запоминаю значение выражения '"Услуга " + $Шаг$' в переменную "НаименованиеУслуги"		
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en'       | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        | 3      | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f687a' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | ''       | '00005'  | ''            | '$НаименованиеУслуги$' | ''                 | ''               | ''               |          |          |          |          |         |
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
	
	
