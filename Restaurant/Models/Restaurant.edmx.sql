
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/14/2018 10:38:17
-- Generated from EDMX file: C:\Users\derachic_ai\Documents\Visual Studio 2017\Projects\Restaurant\Restaurant\Models\Restaurant.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [restaurantdb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'MenuSet'
CREATE TABLE [dbo].[MenuSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [code] nvarchar(max)  NOT NULL,
    [position_name] nvarchar(max)  NOT NULL,
    [wieght] decimal(18,0)  NOT NULL,
    [price] decimal(18,0)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [caloricity] decimal(18,0)  NOT NULL,
    [category] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [order_code] nvarchar(max)  NOT NULL,
    [table_id] int  NOT NULL,
    [waiter_id] int  NOT NULL,
    [timestamp] datetime  NOT NULL
);
GO

-- Creating table 'TableSet'
CREATE TABLE [dbo].[TableSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [code_table] nvarchar(max)  NOT NULL,
    [count_person] smallint  NOT NULL,
    [description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderItemSet'
CREATE TABLE [dbo].[OrderItemSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [position_id] int  NOT NULL,
    [order_id] int  NOT NULL,
    [qnt] nvarchar(max)  NOT NULL,
    [timestamp] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeSet'
CREATE TABLE [dbo].[EmployeeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [tab_no] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [last_name] nvarchar(max)  NOT NULL,
    [birth_day] datetime  NOT NULL,
    [position] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'MenuSet'
ALTER TABLE [dbo].[MenuSet]
ADD CONSTRAINT [PK_MenuSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TableSet'
ALTER TABLE [dbo].[TableSet]
ADD CONSTRAINT [PK_TableSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderItemSet'
ALTER TABLE [dbo].[OrderItemSet]
ADD CONSTRAINT [PK_OrderItemSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeeSet'
ALTER TABLE [dbo].[EmployeeSet]
ADD CONSTRAINT [PK_EmployeeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [table_id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_TableOrder]
    FOREIGN KEY ([table_id])
    REFERENCES [dbo].[TableSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TableOrder'
CREATE INDEX [IX_FK_TableOrder]
ON [dbo].[OrderSet]
    ([table_id]);
GO

-- Creating foreign key on [waiter_id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_EmployeeOrder]
    FOREIGN KEY ([waiter_id])
    REFERENCES [dbo].[EmployeeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeOrder'
CREATE INDEX [IX_FK_EmployeeOrder]
ON [dbo].[OrderSet]
    ([waiter_id]);
GO

-- Creating foreign key on [position_id] in table 'OrderItemSet'
ALTER TABLE [dbo].[OrderItemSet]
ADD CONSTRAINT [FK_MenuOrderItem]
    FOREIGN KEY ([position_id])
    REFERENCES [dbo].[MenuSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuOrderItem'
CREATE INDEX [IX_FK_MenuOrderItem]
ON [dbo].[OrderItemSet]
    ([position_id]);
GO

-- Creating foreign key on [order_id] in table 'OrderItemSet'
ALTER TABLE [dbo].[OrderItemSet]
ADD CONSTRAINT [FK_OrderOrderItem]
    FOREIGN KEY ([order_id])
    REFERENCES [dbo].[OrderSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrderItem'
CREATE INDEX [IX_FK_OrderOrderItem]
ON [dbo].[OrderItemSet]
    ([order_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------