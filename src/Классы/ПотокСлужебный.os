#Использовать logos
#Использовать notify

Перем Лог;

Перем Коллекция;

Процедура УстановитьКоллекцию(НоваяКоллекция) Экспорт
	Коллекция = НоваяКоллекция;
КонецПроцедуры

Функция ПолучитьКоллекцию() Экспорт
	Возврат Коллекция;
КонецФункции

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
		РезультатОбработки = Элемент;
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

Процедура Инициализация()
	Лог = Логирование.ПолучитьЛог("oscript.lib.stream");
	Лог.УстановитьУровень(УровниЛога.Отладка);
КонецПроцедуры

Инициализация();