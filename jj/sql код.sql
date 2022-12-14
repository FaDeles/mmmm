USE [master]
GO
/****** Object:  Database [trade]    Script Date: 08.10.2022 12:56:45 ******/
CREATE DATABASE [trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [trade] SET  MULTI_USER 
GO
ALTER DATABASE [trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [trade] SET QUERY_STORE = OFF
GO
USE [trade]
GO
/****** Object:  Table [Order]    Script Date: 08.10.2022 12:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [OrderProduct]    Script Date: 08.10.2022 12:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product]    Script Date: 08.10.2022 12:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Role]    Script Date: 08.10.2022 12:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User]    Script Date: 08.10.2022 12:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [Role] ON 

INSERT [Role] ([RoleID], [RoleName]) VALUES (1, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (2, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (3, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (4, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (5, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (6, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (7, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (8, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (9, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (10, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (11, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (12, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (13, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (14, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (15, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (16, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (17, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (18, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (19, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (20, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (21, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (22, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (23, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (24, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (25, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (26, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (27, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (28, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (29, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (30, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (31, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (32, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (33, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (34, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (35, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (36, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (37, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (38, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (39, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (40, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (41, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (42, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (43, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (44, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (45, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (46, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (47, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (48, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (49, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (50, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (51, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (52, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (53, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (54, N'')
INSERT [Role] ([RoleID], [RoleName]) VALUES (55, N'клиент')
INSERT [Role] ([RoleID], [RoleName]) VALUES (56, N'менеджер')
INSERT [Role] ([RoleID], [RoleName]) VALUES (57, N'администратор')
SET IDENTITY_INSERT [Role] OFF
GO
SET IDENTITY_INSERT [User] ON 

INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (600, N'Ефемов ', N'Сергей ', N'Пантелеймонович', N'loginDEppn2018', N'6}i+FD', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (601, N'Родионова ', N'Тамара ', N'Валентиновна', N'loginDElqb2018', N'RNynil', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (602, N'Миронова ', N'Галина', N'Улебовна', N'loginDEydn2018', N'34I}X9', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (603, N'Сидоров ', N'Роман', N'Иринеевич', N'loginDEijg2018', N'4QlKJW', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (604, N'Ситников ', N'Парфений', N'Всеволодович', N'loginDEdpy2018', N'MJ0W|f', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (605, N'Никонов ', N'Роман ', N'Геласьевич', N'loginDEwdm2018', N'&PynqU', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (606, N'Щербаков ', N'Владимир ', N'Матвеевич', N'loginDEdup2018', N'JM+2{s', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (607, N'Кулаков ', N'Мартын ', N'Михаилович', N'loginDEhbm2018', N'9aObu4', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (608, N'Сазонова ', N'Оксана ', N'Лаврентьевна', N'loginDExvq2018', N'hX0wJz', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (609, N'Архипов ', N'Варлам ', N'Мэлорович', N'loginDErks2018', N'LQNSjo', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (610, N'Устинова ', N'Ираида ', N'Мэлоровна', N'loginDErvb2018', N'ceAf&R', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (611, N'Лукин ', N'Георгий ', N'Альбертович', N'loginDEulo2018', N'dkcmd', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (612, N'Кононов ', N'Эдуард', N'Валентинович', N'loginDEgfw2018', N'3c2Ic1', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (613, N'Орехова ', N'Клавдия ', N'Альбертовна', N'loginDEmxb2018', N'ZPXcRS', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (614, N'Яковлев ', N'Яков ', N'Эдуардович', N'loginDEgeq2018', N'&&Eim0', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (615, N'Воронов ', N'Мэлс ', N'Семёнович', N'loginDEkhj2018', N'Pbc0t{', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (616, N'Вишнякова ', N'Ия ', N'Данииловна', N'loginDEliu2018', N'32FyTl', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (617, N'Третьяков ', N'Фёдор ', N'Вадимович', N'loginDEsmf2018', N'{{O2QG', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (618, N'Макаров ', N'Максим ', N'Ильяович', N'loginDEutd2018', N'GbcJvC', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (619, N'Шубина ', N'Маргарита ', N'Анатольевна', N'loginDEpgh2018', N'YV2lvh', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (620, N'Блинова ', N'Ангелина ', N'Владленовна', N'loginDEvop2018', N'pBP8rO', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (621, N'Воробьёв ', N'Владлен ', N'Фролович', N'loginDEwjo2018', N'EQaD|d', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (622, N'Сорокина ', N'Прасковья ', N'Фёдоровна', N'loginDEbur2018', N'aZKGeI', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (623, N'Давыдов ', N'Яков ', N'Яков Антонович', N'loginDEszw2018', N'EGU{YE', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (624, N'Рыбакова ', N'Евдокия ', N'Анатольевна', N'loginDExsu2018', N'*2RMsp', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (625, N'Маслов ', N'Геннадий', N'Фролович', N'loginDEztn2018', N'nJBZpU', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (626, N'Цветкова ', N'Элеонора ', N'Аристарховна', N'loginDEtmn2018', N'UObB}N', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (627, N'Евдокимов ', N'Ростислав ', N'Александрович', N'loginDEhep2018', N'SwRicr', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (628, N'Никонова ', N'Венера ', N'Станиславовна', N'loginDEevr2018', N'zO5l}l', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (629, N'Громов ', N'Егор ', N'Антонович', N'loginDEnpa2018', N'M*QLjf', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (630, N'Суворова ', N'Валерия ', N'Борисовна', N'loginDEgyt2018', N'Pav+GP', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (631, N'Мишина ', N'Елизавета ', N'Романовна', N'loginDEbrr2018', N'Z7L|+i', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (632, N'Зимина ', N'Ольга ', N'Аркадьевна', N'loginDEyoo2018', N'UG1BjP', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (633, N'Игнатьев ', N'Игнатий ', N'Антонинович', N'loginDEaob2018', N'3fy+3I', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (634, N'Пахомова ', N'Зинаида ', N'Витальевна', N'loginDEwtz2018', N'&GxSST', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (635, N'Устинов ', N'Владимир ', N'Федосеевич', N'loginDEctf2018', N'sjt*3N', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (636, N'Кулаков ', N'Мэлор ', N'Вячеславович', N'loginDEipm2018', N'MAZl6|', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (637, N'Сазонов ', N'Авксентий ', N'Брониславович', N'loginDEjoi2018', N'o}C4jv', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (638, N'Бурова ', N'Наина ', N'Брониславовна', N'loginDEwap2018', N'4hny7k', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (639, N'Фадеев ', N'Демьян ', N'Федосеевич', N'loginDEaxm2018', N'BEc3xq', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (640, N'Бобылёва ', N'Дарья ', N'Якуновна', N'loginDEsmq2018', N'ATVmM7', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (641, N'Виноградов ', N'Созон ', N'Арсеньевич', N'loginDEeur2018', N'n4V{wP', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (642, N'Гордеев ', N'Владлен ', N'Ефимович', N'loginDEvke2018', N'WQLXSl', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (643, N'Иванова ', N' Зинаида ', N'Валерьевна', N'loginDEvod2018', N'0EW93v', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (644, N'Гусев ', N'Руслан ', N'Дамирович', N'loginDEjaw2018', N'h6z&Ky', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (645, N'Маслов ', N'Дмитрий ', N'Иванович', N'loginDEpdp2018', N'8NvRfC', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (646, N'Антонова ', N'Ульяна ', N'Семёновна', N'loginDEjpp2018', N'oMOQq3', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (647, N'Орехова ', N'Людмила ', N'Владимировна', N'loginDEkiy2018', N'BQzsts', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (648, N'Авдеева ', N'Жанна ', N'Куприяновна', N'loginDEhmn2018', N'a|Iz|7', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (649, N'Кузнецов ', N'Фрол ', N'Варламович', N'loginDEfmn2018', N'cw3|03', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (650, N'Ситникова', N'Эмилия ', N'Степановна', N'LoginDeuch2018', N'1wsws', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (651, N'Воронцова', N'Виктория', N'Саввична', N'LoginDehvc2018', N'2wsw1', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (652, N'Егоров', N'Артем', N'Евгеньевич', N'LoginDehbk2018', N'12fdvdx', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (653, N'Софронов', N'Ярослав', N'Игоревич', N'LoginDehbk2018', N'13fdvdx', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (707, N'Константинова ', N'Вероника', N'Агафоновна', N'DEsgg2018', N'qhgYnW', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (708, N'Меркушев ', N'Мартын', N'Федотович', N'DEdcd2018', N'LxR6YI', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (709, N'Казаков ', N'Федот', N'Кондратович', N'DEisg2018', N'Cp8ddU', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (710, N'Карпов ', N'Улеб', N'Леонидович', N'DEcph2018', N'7YpE0p', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (711, N'Королёв ', N'Матвей', N'Вадимович', N'DEgco2018', N'nMr|ss', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (712, N'Юдин ', N'Герман', N'Кондратович', N'DEwjg2018', N'9UfqWQ', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (713, N'Беляева ', N'Анна', N'Вячеславовна', N'DEjbz2018', N'xIAWNI', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (714, N'Беляев ', N'Валентин', N'Артёмович', N'DEmgu2018', N'0gC3bk', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (715, N'Семёнов ', N'Герман', N'Дмитрьевич', N'DErdg2018', N'ni0ue0', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (716, N'Шестаков ', N'Илья', N'Антонинович', N'DEjtv2018', N'f2ZaN6', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (717, N'Власов ', N'Вадим', N'Васильевич', N'DEtfj2018', N'{{ksPn', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (718, N'Савельев ', N'Арсений', N'Авксентьевич', N'DEpnb2018', N'{ADBdc', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (719, N'Ефимов ', N'Руслан', N'Якунович', N'DEzer2018', N'5&R+zs', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (720, N'Бурова ', N'Марфа', N'Федотовна', N'DEiin2018', N'y9l*b}', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (721, N'Селезнёв ', N'Александр', N'Никитевич', N'DEqda2018', N'|h+r}I', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (722, N'Кулакова ', N'Виктория', N'Георгьевна', N'DEbnj2018', N'sa1wh2', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (723, N'Дорофеева ', N'Кира', N'Демьяновна', N'DEqte2018', N'dC8bDI', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (724, N'Сафонова ', N'Нинель', N'Якововна', N'DEfeo2018', N'8cI7vq', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (725, N'Ситникова ', N'София', N'Лукьевна', N'DEvni2018', N'e4pVIv', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (726, N'Медведев ', N'Ириней', N'Геннадьевич', N'DEjis2018', N'A9K++2', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (727, N'Суханова ', N'Евгения', N'Улебовна', N'DExvv2018', N'R1zh}|', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (728, N'Игнатьев ', N'Владлен', N'Дамирович', N'DEadl2018', N'F&IWf4', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (729, N'Ефремов ', N'Христофор', N'Владиславович', N'DEyzn2018', N'P1v24R', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (730, N'Кошелев ', N'Ростислав', N'Куприянович', N'DEphn2018', N'F}jGsJ', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (731, N'Галкина ', N'Тамара', N'Авксентьевна', N'DEdvk2018', N'NKNkup', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (732, N'Журавлёва ', N'Вера', N'Арсеньевна', N'DEtld2018', N'c+CECK', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (733, N'Савина ', N'Таисия', N'Глебовна', N'DEima2018', N'XK3sOA', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (734, N'Иванов ', N'Яков', N'Мэлорович', N'DEyfe2018', N'4Bbzpa', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (735, N'Лыткин ', N'Ким', N'Алексеевич', N'DEwqc2018', N'vRtAP*', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (736, N'Логинов ', N'Федот', N'Святославович', N'DEgtt2018', N'7YD|BR', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (737, N'Русакова ', N'Марина', N'Юлиановна', N'DEiwl2018', N'LhlmIl', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (738, N'Константинов ', N'Пётр', N'Кондратович', N'DEyvi2018', N'22beR}', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (739, N'Поляков ', N'Анатолий', N'Игоревич', N'DEtfz2018', N'uQY0ZQ', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (740, N'Панфилова ', N'Василиса', N'Григорьевна', N'DEikb2018', N'*QkUxc', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (741, N'Воробьёв ', N'Герман', N'Романович', N'DEdmi2018', N'HOGFbU', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (742, N'Андреев ', N'Ростислав', N'Федосеевич', N'DEtlo2018', N'58Jxrg', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (743, N'Бобров ', N'Агафон', N'Владимирович', N'DEsnd2018', N'lLHqZf', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (744, N'Лапин ', N'Алексей', N'Витальевич', N'DEgno2018', N'4fqLiO', 3)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (745, N'Шестаков ', N'Авдей', N'Иванович', N'DEgnl2018', N'wdio{u', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (746, N'Гаврилова ', N'Алина', N'Эдуардовна', N'DEzna2018', N'yz1iMB', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (747, N'Жуков ', N'Юлиан', N'Валерьянович', N'DEsyh2018', N'&4jYGs', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (748, N'Пономарёв ', N'Максим', N'Альвианович', N'DExex2018', N'rnh36{', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (749, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'DEdjm2018', N'KjI1JR', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (750, N'Осипов ', N'Артём', N'Мэлорович', N'DEgup2018', N'36|KhF', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (751, N'Лапин ', N'Вячеслав', N'Геласьевич', N'DEdat2018', N'ussd8Q', 3)
GO
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (752, N'Зуев ', N'Ириней', N'Вадимович', N'DEffj2018', N'cJP+HC', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (753, N'Коновалова ', N'Агафья', N'Митрофановна', N'DEisp2018', N'dfz5Ii', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (754, N'Исаев ', N'Дмитрий', N'Аристархович', N'DEfrp2018', N'6dcR|9', 2)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (755, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'DEaee2018', N'5&qONH', 1)
INSERT [User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (756, N'Самсонов ', N'Агафон', N'Максимович', N'DEthu2018', N'|0xWzV', 1)
SET IDENTITY_INSERT [User] OFF
GO
ALTER TABLE [OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [Order] ([OrderID])
GO
ALTER TABLE [OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductArticleNumber])
REFERENCES [Product] ([ProductArticleNumber])
GO
ALTER TABLE [User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [trade] SET  READ_WRITE 
GO
