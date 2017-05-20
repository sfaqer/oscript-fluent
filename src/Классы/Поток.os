#Использовать notify
#Использовать logos

Перем Лог;

Перем Конвейер;
Перем Коллекция;

// Общее API

Процедура УстановитьКоллекцию(НоваяКоллекция) Экспорт
	Коллекция = НоваяКоллекция;
	Лог.Отладка("Установлена коллекция размером %1", Коллекция.Количество());
КонецПроцедуры

// Конвейерные методы

Функция Первые(Количество) Экспорт
	
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Количество", Количество);
	
	ПоложитьЯчейкуВКонвейер("Первые", , ДополнительныеПараметры);
	Возврат ЭтотОбъект;

КонецФункции

Функция Пропустить(Количество) Экспорт
	
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Количество", Количество);
	
	ПоложитьЯчейкуВКонвейер("Пропустить", , ДополнительныеПараметры);
	Возврат ЭтотОбъект;

КонецФункции

Функция Различные(ОбработчикСравнения = Неопределено) Экспорт

	Если ОбработчикСравнения = Неопределено Тогда
		ОбработчикСравнения = СтандартныйОбработчикСравнения();
	КонецЕсли;

	ПоложитьЯчейкуВКонвейер("Различные", ОбработчикСравнения);
	Возврат ЭтотОбъект;
	
КонецФункции

Функция Обработать(ОписаниеОповещения) Экспорт
	
	ПоложитьЯчейкуВКонвейер("Обработать", ОписаниеОповещения);
	Возврат ЭтотОбъект;

КонецФункции

Функция Фильтровать(ОписаниеОповещения) Экспорт
	
	ПоложитьЯчейкуВКонвейер("Фильтровать", ОписаниеОповещения);
	Возврат ЭтотОбъект;

КонецФункции

Функция Сортировать(Знач ОбработчикСравнения = Неопределено) Экспорт
	
	Если ОбработчикСравнения = Неопределено Тогда
		ОбработчикСравнения = СтандартныйОбработчикСравнения();
	КонецЕсли;

	ПоложитьЯчейкуВКонвейер("Сортировать", ОбработчикСравнения);
	Возврат ЭтотОбъект;
	
КонецФункции

// Терминальные методы

Функция ПолучитьПервый() Экспорт
	Лог.Отладка("ПолучитьПервый");
	
	ПройтиКонвейер();

	Результат = Неопределено;
	Для Каждого Элемент Из Коллекция Цикл
		Результат = Элемент;
		Прервать;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция ВМассив() Экспорт
	
	Лог.Отладка("ВМассив");

	ПройтиКонвейер();

	Результат = Новый Массив;
	Для Каждого Элемент Из Коллекция Цикл
		Результат.Добавить(Элемент);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция Количество() Экспорт
	
	Лог.Отладка("Количество");
	
	ПройтиКонвейер();
	
	Результат = Коллекция.Количество();
	
	Возврат Результат;

КонецФункции

Функция ДляКаждого(ОписаниеОповещения) Экспорт
	
	Лог.Отладка("ДляКаждого");
	
	ПройтиКонвейер();
	
	Результат = Новый Массив;
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Обработчик", ОписаниеОповещения);
	
	ВыполнитьОбработать(Результат, ДополнительныеПараметры);
	
	Возврат Результат;

КонецФункции

Функция Минимум(ОбработчикСравнения = Неопределено) Экспорт
	
	Лог.Отладка("Минимум");
	
	Если ОбработчикСравнения = Неопределено Тогда
		ОбработчикСравнения = СтандартныйОбработчикСравнения();
	КонецЕсли;

	ПройтиКонвейер();
	
	Результат = Новый Массив;
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Обработчик", ОбработчикСравнения);
	
	ВыполнитьСортировать(Результат, ДополнительныеПараметры);
	
	Если Результат.Количество() = 0 Тогда
		Возврат Неопределено;
	Иначе
		Возврат Результат[0];
	КонецЕсли;

КонецФункции

Функция Максимум(ОбработчикСравнения = Неопределено) Экспорт
	
	Лог.Отладка("Максимум");
	
	Если ОбработчикСравнения = Неопределено Тогда
		ОбработчикСравнения = СтандартныйОбработчикСравнения();
	КонецЕсли;
	
	ПройтиКонвейер();
	
	Результат = Новый Массив;
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Обработчик", ОбработчикСравнения);
	
	ВыполнитьСортировать(Результат, ДополнительныеПараметры);
	
	Если Результат.Количество() = 0 Тогда
		Возврат Неопределено;
	Иначе
		Возврат Результат[Результат.Количество() - 1];
	КонецЕсли;
	
КонецФункции

Функция Сократить(Обработчик, НачальноеЗначение = Неопределено) Экспорт

	Лог.Отладка("Сократить");
	
	ПройтиКонвейер();

	Результат = НачальноеЗначение;
	Для Каждого Элемент Из Коллекция Цикл
		Если Обработчик.ДополнительныеПараметры = Неопределено Тогда
			Обработчик.ДополнительныеПараметры = Новый Структура;
		КонецЕсли;
		Обработчик.ДополнительныеПараметры.Вставить("Элемент", Элемент);
		ОписанияОповещений.ВыполнитьОбработкуОповещения(Обработчик, Результат);
	КонецЦикла;

	Возврат Результат;

КонецФункции

// Служебные процедуры и функции

Процедура ВыполнитьПервые(Результат, ДополнительныеПараметры) Экспорт

	Количество = ДополнительныеПараметры.Количество;

	Лог.Отладка("ВыполнитьПервые %1", Количество);

	Результат = Новый Массив;
	Для сч = 0 По Количество - 1 Цикл
		Элемент = Коллекция[сч];
		Результат.Добавить(Элемент);
	КонецЦикла;

КонецПроцедуры

Процедура ВыполнитьПропустить(Результат, ДополнительныеПараметры) Экспорт
	
	Количество = ДополнительныеПараметры.Количество;
	
	Лог.Отладка("ВыполнитьПропустить %1", Количество);
	
	Результат = Новый Массив;
	Для сч = Количество По Коллекция.ВГраница() Цикл
		Элемент = Коллекция[сч];
		Результат.Добавить(Элемент);
	КонецЦикла;
	
КонецПроцедуры

Процедура ВыполнитьРазличные(Результат, ДополнительныеПараметры) Экспорт

	Лог.Отладка("ВыполнитьРазличные");
	
	Результат = Новый Массив;
	
	ОбработчикСравнения = ДополнительныеПараметры.Обработчик;

	Для Каждого Элемент Из Коллекция Цикл
		
		КоличествоСовпадений = 0;

		Для Каждого ЭлементРезультат Из Результат Цикл
			ОбработчикСравнения.ДополнительныеПараметры.Элемент1 = Элемент;
			ОбработчикСравнения.ДополнительныеПараметры.Элемент2 = ЭлементРезультат;
			РезультатСортировки = Неопределено;
			ОписанияОповещений.ВыполнитьОбработкуОповещения(ОбработчикСравнения, РезультатСортировки);
			Если РезультатСортировки = 0 Тогда
				КоличествоСовпадений = КоличествоСовпадений + 1;
			КонецЕсли;
		КонецЦикла;
	
		Если КоличествоСовпадений = 0 Тогда 
			Результат.Добавить(Элемент);
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура ВыполнитьФильтровать(Результат, ДополнительныеПараметры) Экспорт
	
	Обработчик = ДополнительныеПараметры.Обработчик;
	
	Лог.Отладка("ВыполнитьФильтровать %1", Обработчик.ИмяПроцедуры);
	
	Результат = Новый Массив;
		
	Если Обработчик.ДополнительныеПараметры = Неопределено Тогда
		Обработчик.ДополнительныеПараметры = Новый Структура;
	КонецЕсли;
	Обработчик.ДополнительныеПараметры.Вставить("Элемент");

	Для Каждого Элемент Из Коллекция Цикл
		Обработчик.ДополнительныеПараметры.Элемент = Элемент;
		РезультатФильтрации = Ложь;
		ОписанияОповещений.ВыполнитьОбработкуОповещения(Обработчик, РезультатФильтрации);

		Если РезультатФильтрации Тогда
			Результат.Добавить(Элемент);
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

Процедура ВыполнитьОбработать(Результат, ДополнительныеПараметры) Экспорт
	
	Обработчик = ДополнительныеПараметры.Обработчик;
	
	Лог.Отладка("ВыполнитьОбработать %1", Обработчик.ИмяПроцедуры);
	
	Результат = Новый Массив;
	
	Если Обработчик.ДополнительныеПараметры = Неопределено Тогда
		Обработчик.ДополнительныеПараметры = Новый Структура;
	КонецЕсли;
	Обработчик.ДополнительныеПараметры.Вставить("Элемент");
	
	Для Каждого Элемент Из Коллекция Цикл
		Обработчик.ДополнительныеПараметры.Элемент = Элемент;
		РезультатОбработки = Неопределено;
		ОписанияОповещений.ВыполнитьОбработкуОповещения(Обработчик, РезультатОбработки);
		
		Результат.Добавить(РезультатОбработки);
	КонецЦикла;
	
КонецПроцедуры

Процедура ВыполнитьСортировать(Результат, ДополнительныеПараметры) Экспорт
	
	Обработчик = ДополнительныеПараметры.Обработчик;
	
	Лог.Отладка("ВыполнитьСортировать %1", Обработчик.ИмяПроцедуры);
	
	Результат = Коллекция;
	
	Если Обработчик.ДополнительныеПараметры = Неопределено Тогда
		Обработчик.ДополнительныеПараметры = Новый Структура;
	КонецЕсли;
	Обработчик.ДополнительныеПараметры.Вставить("Элемент1");
	Обработчик.ДополнительныеПараметры.Вставить("Элемент2");

	Для й = 0 По Результат.Количество() - 1 Цикл
		Флаг = Ложь;
		к = Результат.Количество() - 1;
		Пока к > й Цикл
			Элемент = Результат[к - 1];
			СледующийЭлемент = Результат[к];
			Обработчик.ДополнительныеПараметры.Элемент1 = Элемент;
			Обработчик.ДополнительныеПараметры.Элемент2 = СледующийЭлемент;
			РезультатСортировки = Неопределено;
			ОписанияОповещений.ВыполнитьОбработкуОповещения(Обработчик, РезультатСортировки);
			Если РезультатСортировки > 0 Тогда
				Результат[к - 1] = СледующийЭлемент;
				Результат[к] = Элемент;
				Флаг = Истина;
			КонецЕсли;
			к = к - 1;
		КонецЦикла;
		Если НЕ Флаг Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Процедура ОбработчикСравнения(РезультатСортировки, ДополнительныеПараметры) Экспорт
	Элемент1 = ДополнительныеПараметры.Элемент1;
	Элемент2 = ДополнительныеПараметры.Элемент2;
	
	Если Элемент1 = Элемент2 Тогда
		РезультатСортировки = 0;
	ИначеЕсли Элемент1 > Элемент2 Тогда
		РезультатСортировки = 1;
	Иначе
		РезультатСортировки = -1;
	КонецЕсли;
КонецПроцедуры

Функция СтандартныйОбработчикСравнения()
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Элемент1");
	ДополнительныеПараметры.Вставить("Элемент2");

	ФункцияСравнения = ОписанияОповещений.Создать("ОбработчикСравнения", ЭтотОбъект, ДополнительныеПараметры);
	Возврат ФункцияСравнения;
КонецФункции

Процедура ПоложитьЯчейкуВКонвейер(ИмяОперации, 
								  ВходящееОписаниеОповещения = Неопределено, 
								  ДополнительныеПараметры = Неопределено)
	
	Сообщение = ИмяОперации;
	Если ВходящееОписаниеОповещения <> Неопределено Тогда
		Сообщение = Сообщение + " " + ВходящееОписаниеОповещения.ИмяПроцедуры;
	КонецЕсли;
	Лог.Отладка(Сообщение);
	
	Если ДополнительныеПараметры = Неопределено Тогда
		ДополнительныеПараметры = Новый Структура;
	КонецЕсли;
	
	Если ВходящееОписаниеОповещения <> Неопределено Тогда
		ДополнительныеПараметры.Вставить("Обработчик", ВходящееОписаниеОповещения);
	КонецЕсли;

	Ячейка = ОписанияОповещений.Создать("Выполнить" + ИмяОперации, ЭтотОбъект, ДополнительныеПараметры);
	
	Конвейер.Добавить(Ячейка);
	
КонецПроцедуры

Процедура ПройтиКонвейер()

	Лог.Отладка("Прохожу по конвейеру");

	Результат = Новый Массив;
	Для Каждого Ячейка Из Конвейер Цикл
		Лог.Отладка("Выполняю ячейку конвейера %1", Ячейка.ИмяПроцедуры);
		Лог.Отладка("Размер коллекции %1", Коллекция.Количество());

		ОписанияОповещений.ВыполнитьОбработкуОповещения(Ячейка, Результат);
		Коллекция = Результат;
	КонецЦикла;

	Конвейер.Очистить();

КонецПроцедуры

Процедура Инициализация()
	Конвейер = Новый Массив;
	Лог = Логирование.ПолучитьЛог("oscript.lib.stream");
	Лог.УстановитьУровень(УровниЛога.Отладка);
КонецПроцедуры

Инициализация();