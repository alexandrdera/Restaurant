﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Restaurant.BLL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RestaurantContainer : DbContext
    {
        public RestaurantContainer()
            : base("name=RestaurantContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Menu> MenuSet { get; set; }
        public virtual DbSet<Order> OrderSet { get; set; }
        public virtual DbSet<Table> TableSet { get; set; }
        public virtual DbSet<OrderItem> OrderItemSet { get; set; }
        public virtual DbSet<Employee> EmployeeSet { get; set; }
    }
}