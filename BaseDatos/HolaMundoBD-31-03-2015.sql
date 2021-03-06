USE [master]
GO
/****** Object:  Database [HolaMundo]    Script Date: 31/03/2015 13:20:03 ******/
CREATE DATABASE [HolaMundo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HolaMundo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLKENKOX\MSSQL\DATA\HolaMundo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HolaMundo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLKENKOX\MSSQL\DATA\HolaMundo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HolaMundo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HolaMundo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HolaMundo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HolaMundo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HolaMundo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HolaMundo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HolaMundo] SET ARITHABORT OFF 
GO
ALTER DATABASE [HolaMundo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HolaMundo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HolaMundo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HolaMundo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HolaMundo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HolaMundo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HolaMundo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HolaMundo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HolaMundo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HolaMundo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HolaMundo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HolaMundo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HolaMundo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HolaMundo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HolaMundo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HolaMundo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HolaMundo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HolaMundo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HolaMundo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HolaMundo] SET  MULTI_USER 
GO
ALTER DATABASE [HolaMundo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HolaMundo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HolaMundo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HolaMundo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HolaMundo]
GO
/****** Object:  StoredProcedure [dbo].[usp_AltaAutor]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AltaAutor]
	-- Add the parameters for the stored procedure here
	@Nombres as nvarchar(80),
	@ApellidoPaterno as nVarchar(50),
	@ApellidoMaterno as nVarchar(50),
	@CarreraID as int,
	@FotoURL as nvarchar(300)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Autor( Nombres,ApellidoPaterno,ApellidoMaterno,CarreraID,FotoURL,FechaAlta,Eliminado )
	VALUES( @Nombres,@ApellidoPaterno,@ApellidoMaterno,@CarreraID,@FotoURL, getdate(),0)

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaArticulos]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_ConsultaArticulos]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select ArticuloID, NombreArticulo,Resumen,Texto, SeccionID, NumeroID, ImagenURL, Eliminado from Articulo 
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaArticulosAutores]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_ConsultaArticulosAutores]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select ArticuloID, AutorID, Eliminado from AutorArticulo 
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaAutores]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_ConsultaAutores]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select AutorID, Nombres,ApellidoPaterno, ApellidoMaterno, CarreraID, FotoURL from Autor
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaCarreras]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_ConsultaCarreras]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select CarreraID,NombreCarrera, Eliminado from Carrera 
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaNumeros]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_ConsultaNumeros]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select NumeroID,NombreNumero, ImagenURL, Eliminado from Numero 
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaSecciones]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ConsultaSecciones]
	-- Add the parameters for the stored procedure here
	@FechaSincronización as datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select SeccionID, NombreSeccion, Eliminado from Seccion 
		where FechaModificacion >= @FechaSincronización
			OR FechaAlta >= @FechaSincronización

END

GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[ArticuloID] [int] IDENTITY(1,1) NOT NULL,
	[NombreArticulo] [nvarchar](100) NOT NULL,
	[Resumen] [nvarchar](1000) NOT NULL,
	[Texto] [ntext] NOT NULL,
	[SeccionID] [int] NOT NULL,
	[NumeroID] [int] NOT NULL,
	[ImagenURL] [nvarchar](300) NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[ArticuloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autor]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[AutorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](80) NOT NULL,
	[ApellidoPaterno] [nvarchar](50) NOT NULL,
	[ApellidoMaterno] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CarreraID] [int] NOT NULL,
	[SegundaCarreraID] [int] NULL,
	[FotoURL] [nvarchar](300) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[AutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutorArticulo]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorArticulo](
	[AutorID] [int] NOT NULL,
	[ArticuloID] [int] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[CarreraID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCarrera] [nvarchar](100) NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[CarreraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Numero]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numero](
	[NumeroID] [int] IDENTITY(1,1) NOT NULL,
	[NombreNumero] [nvarchar](100) NOT NULL,
	[Editorial] [text] NULL,
	[ImagenURL] [nvarchar](300) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Numero] PRIMARY KEY CLUSTERED 
(
	[NumeroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 31/03/2015 13:20:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seccion](
	[SeccionID] [int] IDENTITY(1,1) NOT NULL,
	[NombreSeccion] [nvarchar](100) NOT NULL,
	[FechaAlta] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[SeccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (1, N'Maestría en Ciencias de la Computación', CAST(0x0000A46C00D39C4F AS DateTime), CAST(0x0000A46C00D39C51 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (2, N'Ingeniería en Telecomunicaciones', CAST(0x0000A46C00D3ACB0 AS DateTime), CAST(0x0000A46C00D3CDC0 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (3, N'Ingeniería en Computacion', CAST(0x0000A46C00D3E4C8 AS DateTime), CAST(0x0000A46C00D3E4C8 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (4, N'Actuaría', CAST(0x0000A46C00D40269 AS DateTime), CAST(0x0000A46C00D40269 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (5, N'Ingeniería en Mecatrónica', CAST(0x0000A46C00D41523 AS DateTime), CAST(0x0000A46C00D41523 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (6, N'Ingeniería Industrial', CAST(0x0000A46C00D42492 AS DateTime), CAST(0x0000A46C00D42492 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (7, N'Dirección Financiera', CAST(0x0000A46C00D43A23 AS DateTime), CAST(0x0000A46C00D43A23 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (8, N'Matemáticas Aplicadas', CAST(0x0000A46C00D45737 AS DateTime), CAST(0x0000A46C00D45737 AS DateTime), 0)
INSERT [dbo].[Carrera] ([CarreraID], [NombreCarrera], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (9, N'Ingeniería en Negocios', CAST(0x0000A46C00D49AF8 AS DateTime), CAST(0x0000A46C00D49AF8 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Numero] ON 

INSERT [dbo].[Numero] ([NumeroID], [NombreNumero], [Editorial], [ImagenURL], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (1, N'Primavera 2012', N'La influencia de la tecnología en la manera en que nos comunicamos no puede ser ignorada, actualmente vivimos en un mundo conectado en donde acceder a un libro o a cualquier tipo de información que no sea originaria de la ciudad en la que vivimos puede
resultar tan simple como dar un clic.

Hablemos de las ciudades inteligentes, de las guerras peleadas en twitter, del conflicto existente en cuanto la privacidad de los datos en Internet. Si bien existe la postura de que se debe proteger los datos y aumentar la privacidad, existe también una postura que dice que
se debe dar una mayor apertura de datos, incluso al cuestionar a Laura Hass sobre el tema (en una conferencia que tuvo lugar en el ITAM), no se fue a ninguno de los dos extremos y dijo que debe existir un equilibrio entre ambos eventos. Estamos en constante movimiento, las personas, las tecnologías, el mundo. Todo cambia, muta y se mueve, afectando así la manera en que se interrelacionan las cosas. ¿Nos movemos porque avanzan las tecnologías o avanzan las tecnologías porque nos movemos? En este número, encontrarán artículos cuyo objetivo es responder la pregunta anterior.

Artículos en donde se analizan los pros y los contras de las redes sociales, de las aplicaciones que nos permiten ponernos en conectarnos a cualquier parte del mundo sin necesidad de horas de viaje y del avance de la tecnología en sí.

Esperamos que disfruten de la lectura de este número y nos despedimos no sin antes agradecer a nombre de todo el equipo de holaMundo a los profesores que han apoyado el proyecto desde su surgimiento, a los profesores que recién se han unido al Consejo Académico y a las representaciones de Ingeniería que nos han brindado su apoyo semestre a semestre. Gracias por confiar en nosotros a lo largo de los seis números hasta ahora impresos.', N'http://www.holamundo.mx/wp-content/uploads/2013/04/P01May2012.jpg', CAST(0x0000A46C00CF62EF AS DateTime), CAST(0x0000A46C00D05F9C AS DateTime), 0)
INSERT [dbo].[Numero] ([NumeroID], [NombreNumero], [Editorial], [ImagenURL], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (2, N'Otoño 2012', N'Hace unos años el iniciar tu propia empresa era una idea descabellada y que sólo unos cuantos se podían permitir concretar. La creencia era que sólo podían ser dueños de una empresa quienes contaban con el capital suficiente, capital obtenido gracias a que se había ahorrado durante un largo periodo de tiempo o a que se contaba con otra empresa de la cual se podían extraer fondos; por lo mismo, pocos se atrevían a intentarlo.

El panorama de México y la manera en que las empresas surgen ha ido cambiando con el paso del tiempo, gracias a lo cual el crear una empresa dejó de ser el privilegio de unos cuantos. Se cayó en cuenta de que las empresas de pequeño y mediano tamaño eran la base de la economía y se empezó a promover cada vez más el desarrollo de las PyMES (Pequeñas y Medianas Empresas) a través de distintos programas gubernamentales que permitían conseguir el apoyo necesario para contar con un capital inicial fuerte. La cultura del emprendimiento empezó a cobrar cada vez más fuerza y campañas como "Pepe y Toño" se volvieron realmente populares. A pesar de todo esto, este tipo de apoyos y campañas seguía sin ser accesible para todos.

Actualmente la fiebre de las "startups" ha llegado a México y con ella la desaparición de la creencia de que para tener una empresa se necesita tener un gran capital inicial. La existencia de los angel investors ha hecho posible que se cuente con apoyo de capital privado y ya no sólo de capital proporcionado por instituciones gubernamentales. Las incubadoras y las aceleradoras de empresas se han convertido en catapultas para las distintas ideas candidatas a startups. El capital ha dejado de ser lo más importante para iniciar una empresa, su lugar ha sido tomando por "la idea" y la propuesta de valor por la que es acompañada, y es que si se tiene una buena idea de negocio se puede tener por seguro que alguna incubadora o alguna aceleradora la tomará en cuenta, con lo cual podrá dejar de ser una idea para pasar a ser una startup.

En este número invitamos a nuestros lectores a adentrarse en el mundo de las startups, a conocer sus fundamentos, los elementos necesarios para poder generar una, los pasos primordiales a seguir y algunos ejemplos mexicanos de ellas.', N'http://www.holamundo.mx/wp-content/uploads/2013/04/P02Dic2013.png', CAST(0x0000A46C00CF9C4D AS DateTime), CAST(0x0000A46C00D0782C AS DateTime), 0)
INSERT [dbo].[Numero] ([NumeroID], [NombreNumero], [Editorial], [ImagenURL], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (3, N'Primavera 2013', N'Desde tiempos remotos, diversas civilizaciones han analizado sus logros a lo largo de la historia. Orgullosos de los avances tecnológicos y sociales logrados a través de arduo trabajo durante siglos, muchos se han preguntado ¿qué sigue? De esta pregunta nace la visión del futuro de la humanidad.

Es claro que, siendo seres racionales, poseemos una gran inquietud de lo que nos depara el tiempo. El futuro es inevitablemente consecuencia de las acciones que tomamos el día de hoy y, por lo tanto, todo proyecto en el que nos embarquemos tiene que tener claro a dónde queremos llegar. Es por esto que nuestra idea conjunta del futuro es motor de la ciencia en el presente.

La visión del futuro como civilización existe. Se vuelve evidente al ver las obras de arte que tratan al respecto. En la Utopía de Tomás Moro podemos ver la sed por un país con un verdadero estado de bienestar para todos los ciudadanos, reflejo de la deplorable situación de las clases bajas en todos los países europeos de la época.

En las obras recientes de ciencia ficción podemos ver una cantidad sorprendente de elementos recurrentes basados en la extrapolación de los adelantos científicos que se han dado en los últimos siglos. Vemos en ellas robots muy avanzados que ya poseen consciencia; una astrofísica que nos permite llevar nuestra economía al espacio; soluciones industriales a base de miles de sensores y computadoras trabajando en conjunto; una red global e incluso interestelar que permea la vida cotidiana de todos, y una medicina que incorpora a la ingeniería en operaciones robóticas y hombres biónicos.

Cada vida humana es un pequeño empujón que direcciona nuestro futuro como civilización. Esta edición de holaMundo celebra nuestra visión del futuro con estos ejemplos y muchos más. Esperamos disfruten de las ideas que tenemos, como ingenieros, de a dónde queremos llegar y cómo lo podremos lograr. Los invitamos a preguntarse cuál es su visión del futuro, y a vivir su vida para llevar a la humanidad un pasito más cerca a ese futuro que desean ver.', N'http://www.holamundo.mx/wp-content/uploads/2013/04/P03May2013.png', CAST(0x0000A46C00CFB9F7 AS DateTime), CAST(0x0000A46C00CFB9F7 AS DateTime), 0)
INSERT [dbo].[Numero] ([NumeroID], [NombreNumero], [Editorial], [ImagenURL], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (4, N'Otoño 2013', N'Red Bull Stratos: 8 millones de personas en vivo por YouTube, más de 32 millones de likes y comentarios en Facebook, 785,000 seguidores de Red Bull en Twitter. Para poder hacerlo posible, Red Bull invirtió millones de dólares en el proyecto. El objetivo principal de Red Bull no era lograr el salto de un hombre desde la estratósfera, sino lograr crear una campaña publicataria masiva que sea observada y cause furor a millones de personas. Entonces viene la pregunta de muchos ¿por qué gastar millones de dólares en un proyecto publicitario que no beneficia a la sociedad? ¿Por qué no invertir esta suma de dinero en un objetivo más loable?

La ciencia es todo aquello que pretende entender, por medio de la investigación, los fenómenos naturales. La ingeniería es aquello que aplica el conocimiento para resolver problemas de una forma novedosa. Es a través de la investigación como llega nuevo conocimiento a la ingeniería, y esta última puede crear soluciones que beneficie a la sociedad. Es difícil impulsar la investigación científica sin un incentivo econónimo detrás.

Los intereses comerciales de la iniciativa privada son grandes impulsores de la investigación científica y del avance tecnológico. Red Bull, con el proyecto Stratos, ayudó de manera importante a la investigación espacial. La exploración espacial ha sido detonante y propulsora de muchos avances tecnológicos. Se dan innumerables casos de ellos como lo son los satélites, sistemas de georreferenciación (GPS) o sistemas de pronóstico del clima. El proyecto Stratos comenzó alrededor del 2005. Todos estos años rindieron como fruto diversas innovaciones que en un futuro serán útiles para la humanidad. Uno de los principales resultados es la investigación de los efectos de altas velocidades, muy bajas temperaturas y baja presión sobre el cuerpo. Los resultados de ésta investigación permitirán a más personas ir más allá de la frontera terrestre y unirse a las filas del turismo espacial. Si bien en el presente la sociedad no se beneficiará de los avances tecnológicos resultantes de este proyecto, con seguridad en el futuro veremos los resultados.

La exploración espacial es la inspiración de este número de holaMundo. Así veremos, por ejemplo, en un artículo que nos cuenta sobre las complicaciones que tuvo el vagabundo para aterrizar en marte; también podrás leer algunas de las cuestiones que deja la culminación del programa del trabsbordador espacial. Otro cambio importante es que a partir de este número utilizaremos las nuevas reglas de ortografía y gramática que la Real Academia Española ha publicado en sus obras de Gramática y Ortografía, con el fin de establecer un margen a la calidad de la escritura de los artílos de esta revista.

Finalmente, agradecemos el apoyo de todas las personas involucradas en este proyecto: los directivos del Instituto Tecnológico de México; los profesores de los departamentos de Computación y Sistemas Digitales, en especia de los miembros del Consejo Editorial; el Consejo Universitario de Honor y Excelencia; el Fondo de Organizaciones Estudiantiles, a los alumnos que mandaron sus artílos y, por último pero no menos importante, al equipo de trabajo de holaMundo que hizo posible este número.', N'http://www.holamundo.mx/wp-content/uploads/2013/12/portada_corregida.jpg', CAST(0x0000A46C00CFDCE0 AS DateTime), CAST(0x0000A46C00D0A8FB AS DateTime), 0)
INSERT [dbo].[Numero] ([NumeroID], [NombreNumero], [Editorial], [ImagenURL], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (5, N'Otoño 2014', N'La cantidad de información que tenemos a nuestro alcance en la actualidad es alucinante. Tan sólo Wikipedia tiene poco menos de cuatro millones de artículos en inglés, Facebook tiene más de 900 millones de usuarios activos y se generan cerca de 200 millones de Tweets al día. La era de la información ha llegado. Nuestro reto: entenderla.

El éxito como individuos y países dependerá cada vez más de nuestras habilidades para lidiar con la inmnensa cantidad de datos a nuestro alcance. Los defensores del concepto de la era de la información sostienen que la información y las comunicaciones se incorporarán en todos los procesos productivos y definirán las interacciones humanas.

Ya Castells argumentaba que este proceso amenaza con hacer prescindibles a países excluides de las redes de la información. Estos tiempos presentan retos para países, como México, que están en vías de desarrollo.

¿Qué tipo de profesionistas necesita nuestro país para enfrentar un mundo en el que la realidad se acerca cada vez más a la ficción? ¿Qué hombre será suficiente para comeptir con el Hombre Artificial del Dr. Cairó? En éste número encontraremos interesantes artículos sobre los temas más variados: desde cómo atrapar a un asesino en serie hasta consideraciones acerca de algunas estructuras de datos eficientes; desde un artículo que propone que Super Mario Bros es un problema (NP-) difícil hasta una reflexión sobre la relación entre la psicología del ser humano y el abuso de la tecnología. Todos con el propósito de ampliar nuestro criterio sobre la tecnología y estar mejor preparados para enfrentar los retos que en el futuro próximo nos encontraremos.', N'http://www.holamundo.mx/wp-content/uploads/2014/11/Screen-Shot-2014-11-25-at-7.05.58-PM.png', CAST(0x0000A46C00D00EF3 AS DateTime), CAST(0x0000A46C00D05C59 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Numero] OFF
SET IDENTITY_INSERT [dbo].[Seccion] ON 

INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (1, N'Movilidad y Comunicaciones', CAST(0x0000A46C00CD4C61 AS DateTime), CAST(0x0000A46C00CD4C63 AS DateTime), 0)
INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (2, N'Industria', CAST(0x0000A46C00CD8141 AS DateTime), CAST(0x0000A46C00CD8141 AS DateTime), 0)
INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (3, N'Biotecnología', CAST(0x0000A46C00CD8E27 AS DateTime), CAST(0x0000A46C00CD8E27 AS DateTime), 0)
INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (4, N'Robótica', CAST(0x0000A46C00CD9741 AS DateTime), CAST(0x0000A46C00CD9741 AS DateTime), 0)
INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (5, N'Procesamiento', CAST(0x0000A46C00CD9DE6 AS DateTime), CAST(0x0000A46C00CD9DE6 AS DateTime), 0)
INSERT [dbo].[Seccion] ([SeccionID], [NombreSeccion], [FechaAlta], [FechaModificacion], [Eliminado]) VALUES (6, N'Opinión', CAST(0x0000A46C00CDAEC2 AS DateTime), CAST(0x0000A46C00CDAEC2 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Seccion] OFF
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Numero] FOREIGN KEY([NumeroID])
REFERENCES [dbo].[Numero] ([NumeroID])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Numero]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Seccion] FOREIGN KEY([SeccionID])
REFERENCES [dbo].[Seccion] ([SeccionID])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Seccion]
GO
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_Carrera] FOREIGN KEY([CarreraID])
REFERENCES [dbo].[Carrera] ([CarreraID])
GO
ALTER TABLE [dbo].[Autor] CHECK CONSTRAINT [FK_Autor_Carrera]
GO
ALTER TABLE [dbo].[AutorArticulo]  WITH CHECK ADD  CONSTRAINT [FK_AutorArticulo_Articulo] FOREIGN KEY([ArticuloID])
REFERENCES [dbo].[Articulo] ([ArticuloID])
GO
ALTER TABLE [dbo].[AutorArticulo] CHECK CONSTRAINT [FK_AutorArticulo_Articulo]
GO
ALTER TABLE [dbo].[AutorArticulo]  WITH CHECK ADD  CONSTRAINT [FK_AutorArticulo_Autor] FOREIGN KEY([AutorID])
REFERENCES [dbo].[Autor] ([AutorID])
GO
ALTER TABLE [dbo].[AutorArticulo] CHECK CONSTRAINT [FK_AutorArticulo_Autor]
GO
USE [master]
GO
ALTER DATABASE [HolaMundo] SET  READ_WRITE 
GO
