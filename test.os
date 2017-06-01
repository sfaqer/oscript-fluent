#Использовать "."
#Использовать notify

Процедура ОбработчикФильтрации(Результат, ДополнительныеПараметры) Экспорт
	Элемент = ДополнительныеПараметры.Элемент;
	Результат = Элемент > 3;
КонецПроцедуры

Процедура ОбработчикОбработки(Результат, ДополнительныеПараметры) Экспорт
	Элемент = ДополнительныеПараметры.Элемент;
	Результат = Элемент + 1;
	Сообщить("Я - операция map, и это мое послание миру: элемент " + Элемент + " превратился в " + Результат);
КонецПроцедуры

Процедура ОбработчикСокращения(Результат, ДополнительныеПараметры) Экспорт
	Элемент = ДополнительныеПараметры.Элемент;
	Результат = Результат + Элемент;
КонецПроцедуры

ФункцияФильтрации = ОписанияОповещений.Создать("ОбработчикФильтрации", ЭтотОбъект);
ФункцияОбработки = ОписанияОповещений.Создать("ОбработчикОбработки", ЭтотОбъект);
ФункцияСокращения = ОписанияОповещений.Создать("ОбработчикСокращения", ЭтотОбъект);

Массив = Новый Массив;
Массив.Добавить(3);
Массив.Добавить(4);
Массив.Добавить(7);
Массив.Добавить(5);
Массив.Добавить(1);
Массив.Добавить(0);

ПроцессорКоллекций = Новый ПроцессорКоллекций;
ПроцессорКоллекций.УстановитьКоллекцию(Массив);

Результат = ПроцессорКоллекций
	.Пропустить(2)
	.Фильтровать(ФункцияФильтрации)
	.Первые(2)
	.Обработать(ФункцияОбработки)
	.Получить(Тип("Массив"));

Для Каждого Элемент Из Результат Цикл
	Сообщить(Элемент);
КонецЦикла;

ПроцессорКоллекций = ПроцессорыКоллекций.ИзКоллекции(Массив);
ПроцессорКоллекций
	.Сортировать()
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());

Массив = Новый Массив;
Массив.Добавить(4);
Массив.Добавить(2);
Массив.Добавить(2);
Массив.Добавить(3);
Массив.Добавить(3);
Массив.Добавить(3);

ПроцессорКоллекций = ПроцессорыКоллекций.ИзКоллекции(Массив);
ПроцессорКоллекций
	.Различные()
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());

ПроцессорКоллекций = ПроцессорыКоллекций.ИзКоллекции(Массив);
Результат = ПроцессорКоллекций
	.Обработать(ФункцияОбработки)
	.Сократить(ФункцияСокращения, 0);

Сообщить(Результат);

// Результат должен различаться
ПроцессорыКоллекций
	.ИзКоллекции(Массив)
	.Сортировать()
	.Первые(1)
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());
Сообщить(Массив[0]);

Строка = "ФЫВА";
ПроцессорыКоллекций
	.ИзСтроки(Строка)
	.Сортировать()
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());

Строка = "Я строка с пробелами";
ПроцессорыКоллекций
	.ИзСтроки(Строка, " ")
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());

Строка = "Я
|строка
|многострочная";

ПроцессорыКоллекций
	.ИзСтроки(Строка, Символы.ПС)
	.Сортировать()
	.ДляКаждого(ПроцессорыКоллекций.СтандартнаяФункцияОбработки_Сообщить());

ПроцессорыКоллекций
	.ИзСтроки(Строка, Символы.ПС)
	.Фильтровать("Результат = СтрДлина(Элемент) > 1")
	.ДляКаждого("Сообщить(Элемент)");
