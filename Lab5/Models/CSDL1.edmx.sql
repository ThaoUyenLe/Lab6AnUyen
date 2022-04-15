
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/15/2022 12:09:35
-- Generated from EDMX file: C:\Users\s1924\OneDrive\Desktop\Working\2_thin\CNPMNC\Lab5\Lab5\Models\CSDL1.edmx
-- --------------------------------------------------
CREATE DATABASE [CSDL1];
SET QUOTED_IDENTIFIER OFF;
GO
USE [CSDL1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_idCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [fk_idCategory];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [categoryId] int  NOT NULL,
    [categoryName] nvarchar(150)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int  NOT NULL,
    [pName] nvarchar(150)  NULL,
    [pType] nvarchar(150)  NULL,
    [pPrice] float  NULL,
    [categoryId_] int  NULL,
    [imgProduct] varchar(150)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [categoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([categoryId] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [categoryId_] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [fk_idCategory]
    FOREIGN KEY ([categoryId_])
    REFERENCES [dbo].[Categories]
        ([categoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_idCategory'
CREATE INDEX [IX_fk_idCategory]
ON [dbo].[Products]
    ([categoryId_]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------