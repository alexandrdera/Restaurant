//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Restaurant.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderItem
    {
        public int Id { get; set; }
        public int order_id { get; set; }
        public int position_id { get; set; }
        public string qnt { get; set; }
        public string timestamp { get; set; }
    
        public virtual Menu Menu { get; set; }
        public virtual Order Order { get; set; }
    }
}
