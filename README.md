# Restaurant
Структура БД для простой системы учета заказов в ресторане.

#### В работе использовались
  * ASP.NET MVC5 - основа проекта; 
  * Entity Framework 6 - проектирование БД через подход ModelFirst.

#### Описание проекта
EDMX диаграмма Model/Restaurant.edmx включает 5 сущностей:
  * *Menu* - меню с перечнем позиций;
  * *Table* - столики;
  * *Employee* - сотрудники и официанты ресторана;
  * *Order* - заказы
  * *OrderItem* - позиции заказа, то что заказал столик(или клиент)

Из модели были сгенерированы:
  * *Restaurant.Context.cs* - код контекста;
  * *Restaurant.tt* - узел с классами моделей;
  * *Restaurant.edmx.sql* - скритп для развертывания струтуры БД.
    
Перед запуском *Restaurant.edmx.sql* предварительно создал БД */App_Data/restaurantdb.mdf*, после создания струтуры добавил в проект.

Строка подключения БД описана в *Web.config*:
```xml
  <connectionStrings>
    <add name="RestaurantContainer" connectionString="metadata=res://*/Models.Restaurant.csdl|res://*/Models.Restaurant.ssdl|res://*/Models.Restaurant.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=(LocalDB)\MSSQLLocalDB;attachdbfilename=|DataDirectory|\restaurantdb.mdf;initial catalog=restaurantdb;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
  </connectionStrings>
```

#### EDMX диаграмма:

![EDMX диаграмма Model/Restaurant.edmx](https://raw.githubusercontent.com/alexandrdera/Restaurant/master/Restaurant/App_Data/EntityDesignerDiagram.bmp "EDMX диаграмма Model/Restaurant.edmx")
