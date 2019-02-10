SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hints](
	[HintId] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[HintText] [varchar](1024) NOT NULL,
	[HintOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mixes](
	[MixId] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[FirebaseId] [varchar](255) NOT NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [bigint] IDENTITY(1,1) NOT NULL,
	[CorrectAnswer] [bigint] NOT NULL,
	[ImageUrl] [varchar](255) NOT NULL,
	[SerializedSteps] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionQuestion](
	[SessionQuestionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SessionId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[HintsShown] [int] NOT NULL,
	[GivenAnswer] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SessionGuid] [uniqueidentifier] NOT NULL,
	[PlayerId] [bigint] NULL,
	[AnonPlayerName] [nvarchar](32) NULL,
	[SessionLength] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[SongId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstAppeared] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[TitleRomanized] [varchar](255) NULL,
	[Artist] [nvarchar](255) NOT NULL,
	[ArtistRomanized] [varchar](255) NULL,
 CONSTRAINT [PK__Songs__3214EC072236D182] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mixes] ON 
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (1, N'DanceDanceRevolution', CAST(N'1998-09-26' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (2, N'DanceDanceRevolution 2ndMIX', CAST(N'1999-01-29' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (3, N'DanceDanceRevolution 2ndMIX with beatmania IIDX CLUB VERSiON', CAST(N'1999-04-21' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (4, N'DanceDanceRevolution 2ndMIX LINK VERSION', CAST(N'1999-04-28' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (5, N'DanceDanceRevolution 2ndMIX AND beatmania IIDX substream CLUB VERSiON 2', CAST(N'1999-07-27' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (6, N'DanceDanceRevolution Solo BASS MIX', CAST(N'1999-08-19' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (7, N'DanceDanceRevolution 3rdMIX', CAST(N'1999-10-30' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (8, N'DanceDanceRevolution Solo 2000', CAST(N'1999-12-16' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (9, N'DanceDanceRevolution 3rdMIX VER.KOREA', CAST(N'2000-04-01' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (10, N'DanceDanceRevolution 3rdMIX Ver.KOREA2', CAST(N'2000-05-01' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (11, N'DanceDanceRevolution 3rdMIX PLUS', CAST(N'2000-06-21' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (12, N'DanceDanceRevolution 4thMIX', CAST(N'2000-08-24' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (13, N'DanceDanceRevolution 4thMIX PLUS', CAST(N'2000-12-28' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (14, N'DanceDanceRevolution 5thMIX', CAST(N'2001-03-27' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (15, N'DDRMAX -DanceDanceRevolution 6thMIX-', CAST(N'2001-10-19' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (16, N'DDRMAX2 -DanceDanceRevolution 7thMIX-', CAST(N'2002-03-27' AS Date))
GO
INSERT [dbo].[Mixes] ([MixId], [Title], [ReleaseDate]) VALUES (17, N'DanceDanceRevolution EXTREME', CAST(N'2002-12-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Mixes] OFF
GO
SET IDENTITY_INSERT [dbo].[Songs] ON 
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (1, 1, N'BUTTERFLY', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (2, 1, N'HAVE YOU NEVER BEEN MELLOW', NULL, N'THE OLIVIA PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (3, 1, N'KUNG FU FIGHTING', NULL, N'BUT STOP featuring CARL DOUGLAS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (4, 1, N'LET''S GET DOWN', NULL, N'JT PLAYAZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (5, 1, N'LITTLE BITCH', NULL, N'THE SPECIALS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (6, 1, N'MY FIRE', NULL, N'X-TREME', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (7, 1, N'STRICTLY BUSINESS', NULL, N'MANTRONIK VS EPMD', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (8, 1, N'THAT''S THE WAY (I LIKE IT)', NULL, N'KC & THE SUNSHINE BAND', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (9, 1, N'MAKE IT BETTER', NULL, N'mitsu-O!', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (10, 1, N'PARANOiA', NULL, N'180', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (11, 1, N'TRIP MACHINE', NULL, N'DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (12, 2, N'BAD GIRLS', NULL, N'Juliet Roberts', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (13, 2, N'BOOM BOOM DOLLAR', NULL, N'King Kong & D.Jungle Girls', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (14, 2, N'BOYS', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (15, 2, N'DUB-I-DUB', NULL, N'ME & MY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (16, 2, N'GET UP''N MOVE', NULL, N'S&K', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (17, 2, N'HERO', NULL, N'PAPAYA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (18, 2, N'I believe in miracles', NULL, N'HI-RISE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (19, 2, N'IF YOU WERE HERE', NULL, N'JENNIFER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (20, 2, N'SMOKE', NULL, N'MR.ED JUMPS THE GUN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (21, 2, N'stomp to my beat', NULL, N'JS16', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (22, 2, N'AM-3P', NULL, N'KTz', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (23, 2, N'BRILLIANT 2U', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (24, 2, N'BRILLIANT 2U (Orchestra-Groov)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (25, 2, N'MAKE IT BETTER (So-REAL Mix)', NULL, N'mitsu-O!SUMMER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (26, 2, N'PARANOiA MAX ~DIRTY MIX~', NULL, N'190', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (27, 2, N'PARANOiA MAX ~DIRTY MIX~ (in roulette)', NULL, N'190', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (28, 2, N'PUT YOUR FAITH IN ME', NULL, N'UZI-LAY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (29, 2, N'PUT YOUR FAITH IN ME (Jazz Groov)', NULL, N'UZI-LAY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (30, 2, N'SP-TRIP MACHINE～JUNGLE MIX～', NULL, N'DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (31, 2, N'20,NOVEMBER (D.D.R. VERSION)', NULL, N'N.M.R feat. DJ nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (32, 2, N'KEEP ON MOVIN''', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (33, 2, N'LET THEM MOVE', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (34, 3, N'been so long', NULL, N'm-flo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (35, 3, N'The rhyme brokers', NULL, N'm-flo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (36, 3, N'The Theme from "Flo-jack"', NULL, N'm-flo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (37, 3, N'YOU MAKE ME', NULL, N'MONDAY MICHIRU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (38, 3, N'20,november', NULL, N'DJ nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (39, 3, N'celebrate', NULL, N'JJ COMPANY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (40, 3, N'Do you love me?', NULL, N'reo-nagumo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (41, 3, N'Dr.LOVE', NULL, N'baby weapon feat.Asuka.M', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (42, 3, N'Jam Jam Reggae', NULL, N'jam master ''73', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (43, 3, N'LUV TO ME(disco mix)', NULL, N'tiger YAMATO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (44, 3, N'melt in my arms', NULL, N'Honey P feat.Asuka.M', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (45, 3, N'R3', NULL, N'tiger YAMATO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (46, 3, N'special energy', NULL, N'DJ FX', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (47, 4, N'EL RITMO TROPICAL', NULL, N'DIXIES GANG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (48, 4, N'LOVE', NULL, N'SONIC DREAM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (49, 4, N'MAKE A JAM!', NULL, N'U1', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (50, 4, N'PARANOiA KCET ～clean mix～', NULL, N'2MB', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (51, 4, N'TUBTHUMPING', NULL, N'CHUMBAWAMBA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (52, 5, N'ちょっときいてな (ZANSHIN-NA MIX)', N'Chotto kiitena (ZANSHIN-NA MIX)', N'Laugh & Peace', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (53, 5, N'22DUNK', NULL, N'SLAKE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (54, 5, N'5.1.1.', NULL, N'dj nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (55, 5, N'Be in my paradise', NULL, N'JJ COMPANY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (56, 5, N'BEGINNING-OF-LIFE', NULL, N'QUADRA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (57, 5, N'Deep clear eyes', NULL, N'QUADRA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (58, 5, N'DEEP IN YOU', NULL, N'dj nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (59, 5, N'diving money', NULL, N'QUADRA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (60, 5, N'e-motion', NULL, N'e.o.s', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (61, 5, N'g.m.d.', NULL, N'DJ mazinger featuring Muhammad', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (62, 5, N'GAMBOL', NULL, N'SLAKE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (63, 5, N'GENOM SCREAMS', NULL, N'L.E.D.LIGHT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (64, 5, N'gentle stress', NULL, N'DJ Swan', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (65, 5, N'GRADIUSIC CYBER', NULL, N'TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (66, 5, N'Into the world', NULL, N'QUADRA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (67, 5, N'LOVE SO GROOVY', NULL, N'LOVEMINTS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (68, 5, N'Macho Gang', NULL, N'ANAL SPYDER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (69, 5, N'OVERDOSER', NULL, N'MIRAK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (70, 5, N'patsenner', NULL, N'dj nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (71, 5, N'PERFECT FREE', NULL, N'nite system', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (72, 5, N'Prince on a star', NULL, N'SPIRITUAL RIDE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (73, 5, N'Queen''s Jamaica (astria mix)', NULL, N'Crunky boy (featuring Muhammad)', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (74, 5, N'RUGGED ASH', NULL, N'SYMPHONIC DEFOGGERS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (75, 5, N'Salamander Beat Crush mix', NULL, N'nite system', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (76, 5, N'ska a go go', NULL, N'THE BALD HEADS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (77, 5, N'THE EARTH LIGHT', NULL, N'L.E.D. LIGHT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (78, 6, N'LOVE MACHINE', NULL, N'PONY TOWN BOYZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (79, 6, N'FREAKY', NULL, N'DE LITE & MC YOUNG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (80, 6, N'Club Tropicana', NULL, N'Cydney D', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (81, 6, N'KUNG FU FIGHTING (MIAMI BOOTY MIX)', NULL, N'BUS STOP featuring CARL DOUGLAS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (82, 6, N'SAMBA DE JANEIRO', NULL, N'BASS FIST! feat. BOOGIE GIRL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (83, 6, N'DON''T CLOCK ME', NULL, N'POPULA DEMAND feat. THE GET FRESH GIRLS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (84, 6, N'GET OFF', NULL, N'WIZZZZARD', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (85, 6, N'THAT''S THE WAY ''98', NULL, N'DJ BASS feat. MC DIXIE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (86, 6, N'I''M ALIVE', NULL, N'UNCLE 36 SEC feat. MC TAIWAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (87, 6, N'TOGETHER & FOREVER', NULL, N'NINEBALL feat. ATOMIC GUN & JULIA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (88, 6, N'MY BABY MAMA', NULL, N'ANQUETTE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (89, 6, N'GET UP''N MOVE', NULL, N'S&K', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (90, 6, N'PARANOIA EVOLUTION', NULL, N'200', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (91, 6, N'HYSTERIA', NULL, N'NAOKI 190', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (92, 6, N'Let the beat hit em!', NULL, N'Stone Bros.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (93, 6, N'SUPER STAR', NULL, N'D.J.RICH feat. Tail Bros.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (94, 7, N'BOOM BOOM DOLLAR (K.O.G.G3 MIX)', NULL, N'KING KONG & D.JUNGLE GIRLS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (95, 7, N'BUTTERFLY (UPSWING MIX)', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (96, 7, N'CAPTAIN JACK (GRANDALE REMIX)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (97, 7, N'DAM DARIRAM', NULL, N'JOGA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (98, 7, N'DO IT ALL NIGHT', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (99, 7, N'FLASHDANCE (WHAT A FEELING)', NULL, N'MAGIKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (100, 7, N'FOLLOW THE SUN (90 IN THE SHADE MIX)', NULL, N'TRIPLE J', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (101, 7, N'GET UP (BEFORE THE NIGHT IS OVER)', NULL, N'TECHNOTRONIC feat.YA KID K', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (102, 7, N'GET UP AND DANCE', NULL, N'FREEDOM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (103, 7, N'HOLIDAY', NULL, N'WHO''S THAT GIRL!', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (104, 7, N'IF YOU CAN SAY GOODBYE', NULL, N'KATE PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (105, 7, N'IN THE NAVY ''99 (XXL Disaster Remix)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (106, 7, N'IT ONLY TAKES A MINUTE (Extended Remix)', NULL, N'TAVARES', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (107, 7, N'MR.WONDERFUL', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (108, 7, N'OH NICK PLEASE NOT SO QUICK', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (109, 7, N'OPERATOR (Two Gees Mix)', NULL, N'PAPAYA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (110, 7, N'ROCK BEAT', NULL, N'LOUD FORCE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (111, 7, N'SO MANY MEN', NULL, N'ME & MY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (112, 7, N'THE RACE', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (113, 7, N'TURN ME ON (HEAVENLY MIX)', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (114, 7, N'UPSIDE DOWN', NULL, N'COO COO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (115, 7, N'VOL.4', NULL, N'RAVERS CHOICE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (116, 7, N'WONDERLAND (UKS MIX)', NULL, N'X-TREME', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (117, 7, N'XANADU', NULL, N'OLIVIA PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (118, 7, N'20,NOVEMBER (D.D.R. VERSION)', NULL, N'N.M.R feat. DJ nagureo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (119, 7, N'AFRONOVA', NULL, N'RE-VENGE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (120, 7, N'DEAD END', NULL, N'N&S', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (121, 7, N'DYNAMITE RAVE', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (122, 7, N'END OF THE CENTURY', NULL, N'NO.9', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (123, 7, N'KEEP ON MOVIN''', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (124, 7, N'La Senorita', NULL, N'CAPTAIN.T', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (125, 7, N'LET THEM MOVE', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (126, 7, N'PARANOiA Rebirth', NULL, N'190''', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (127, 7, N'Silent Hill', NULL, N'THOMAS HOWARD', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (128, 7, N'gentle stress (AMD SEXUAL MIX)', NULL, N'MR.DOG feat. DJ SWAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (129, 7, N'GRADIUSIC CYBER (AMD G5 MIX)', NULL, N'BIG-O feat. TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (130, 7, N'Jam Jam Reggae (AMD SWING MIX)', NULL, N'RICE.C feat. jam master ''73', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (131, 7, N'LUV TO ME (AMD MIX)', NULL, N'DJ KAZU feat. tiger YAMATO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (132, 8, N'I''M ALIVE', NULL, N'CUT ''N'' MOVE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (133, 8, N'HIGH ENERGY (John ''00'' Fleming Remix)', NULL, N'SLIP & SHUFFLE featuring LEON', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (134, 8, N'SKY HIGH', NULL, N'DJ MIKO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (135, 8, N'TEMPLE OF LOVE', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (136, 8, N'DRILL INSTRUCTOR (C-Jah Happy Mix)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (137, 8, N'KISS ME (KCP REMIX)', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (138, 8, N'DREAM A DREAM (MIAMI BOOTY MIX)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (139, 8, N'I DON''T WANT TO MISS A THING (Planet Lution Mix)', NULL, N'DEJA VU featuring TASMIN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (140, 8, N'TOGETHER & FOREVER', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (141, 8, N'Typical Tropical', NULL, N'BAMBEE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (142, 8, N'STRUT YOUR FUNKY STUFF', NULL, N'DIAMOND', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (143, 8, N'think ya better D', NULL, N'sAmi', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (144, 8, N'CAN''T STOP FALLIN'' IN LOVE', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (145, 8, N'CELEBRATE NITE', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (146, 8, N'WILD RUSH', NULL, N'FACTOR-X', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (147, 8, N'SEXY PLANET', NULL, N'Crystal Aliens', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (148, 8, N'LOVE THIS FEELIN''', NULL, N'Chang Ma', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (149, 8, N'TRIP MACHINE ～luv mix～', NULL, N'2MB', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (150, 8, N'DROP OUT', NULL, N'NW260', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (151, 8, N'Let the beat hit em! (BM IIDX version)', NULL, N'Stone Bros.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (152, 9, N'바꿔', N'BA KKWO', N'이정현', N'LEE JUNG HYUN')
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (153, 9, N'부담', N'BU DAM', N'백지영', N'BAEK JI YOUNG')
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (154, 9, N'별', N'BYUL', N'TEAM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (155, 9, N'FACE', NULL, N'N.R.G', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (156, 9, N'성숙', N'SUNG SUK', N'SPACE A', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (157, 9, N'TELL ME TELL ME', NULL, N'S#ARP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (158, 9, N'와', N'WA', N'이정현', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (159, 10, N'아름다운 21C', N'AROMDAON 21C / BEAUTIFUL 21C', N'2000 대한민국', N'2000 KOREA')
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (160, 10, N'가까이', N'GAGGAI', N'(s#arp)', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (161, 10, N'가면의 시간', N'GAMYEONUI SIGAN', N'FIN.K.L', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (162, 10, N'GIMME GIMME', NULL, N'컨츄리꼬꼬', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (163, 10, N'경고', N'GYOUNG GO', N'타샤니', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (164, 10, N'호기심', N'HOGISIM', N'한스 밴드', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (165, 10, N'ROSE', NULL, N'FIN.K.L', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (166, 10, N'SHOCK', NULL, N'GOOFY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (167, 10, N'Starian', NULL, N'DUKE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (168, 11, N'BUMBLE BEE', NULL, N'bambee', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (169, 11, N'GIMME GIMME GIMME', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (170, 11, N'HERO (KCP DISCOTIQUE MIX)', NULL, N'PAPAYA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (171, 11, N'AFTER THE GAME OF LOVE', NULL, N'NPD3', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (172, 11, N'CUTIE CHASER', NULL, N'CLUB SPICE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (173, 11, N'DROP THE BOMB', NULL, N'Scotty D.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (174, 11, N'La Senorita Virtual', NULL, N'2MB', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (175, 12, N'1,2,3,4,007', NULL, N'NI-NI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (176, 12, N'BOYS (EURO MIX)', NULL, N'SMILE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (177, 12, N'DREAM A DREAM', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (178, 12, N'EAT YOU UP', NULL, N'ANGIE GOLD', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (179, 12, N'GOTCHA (The Theme from STARSKY & HUTCH)', NULL, N'ANDY G''S MAGIC DISCO MACHINE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (180, 12, N'HAVE YOU NEVER BEEN MELLOW (MM GROOVIN MIX)', NULL, N'THE OLIVIA PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (181, 12, N'IN THE HEAT OF THE NIGHT', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (182, 12, N'KICK THE CAN', NULL, N'BUS STOP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (183, 12, N'MUSIC', NULL, N'HABEGALE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (184, 12, N'NEVER GONNA MAKE (FACTORY DANCE TEAM MIX)', NULL, N'MORGANA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (185, 12, N'NIGHT IN MOTION', NULL, N'CUBIC 22', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (186, 12, N'NINZABURO / FURUHATA''S THEME', NULL, N'CJ Crew feat.Sedge', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (187, 12, N'ONE TWO (LITTLE BITCH)', NULL, N'BUS STOP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (188, 12, N'ONLY YOU', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (189, 12, N'PINK DINOSAUR', NULL, N'PAPAYA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (190, 12, N'SAINT GOES MARCHING (REMIX)', NULL, N'THE SAINT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (191, 12, N'SHAKE YOUR BOOTY', NULL, N'KC & THE SUNSHINE BAND', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (192, 12, N'SHOOTING STAR', NULL, N'BANG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (193, 12, N'THE 7 JUMP', NULL, N'KEN D', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (194, 12, N'WALKIE TALKIE', NULL, N'KING KONG & D.JUNGLE GIRLS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (195, 12, N'Young Forever', NULL, N'REBECCA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (196, 12, N'B4U', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (197, 12, N'BABY BABY GIMME YOUR LOVE', NULL, N'DIVAS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (198, 12, N'BURNIN'' THE FLOOR', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (199, 12, N'HIGHER', NULL, N'NM feat. SUNNY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (200, 12, N'HYPNΦTIC CRISIS', N'HYPNOTIC CRISIS', N'BLUE DESTROYERS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (201, 12, N'LOVE AGAIN TONIGHT (For Melissa MIX)', NULL, N'NAOKI feat. PAULA TERRY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (202, 12, N'MY SUMMER LOVE', NULL, N'mitsu-O! with GEILA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (203, 12, N'ORION.78 (AMeuro-MIX)', NULL, N'RE-VENGE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (204, 12, N'TRIP MACHINE CLIMAX', NULL, N'DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (205, 10, N'DAM DARIRAM (KCP MIX)', NULL, N'JOGA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (206, 10, N'HERO (HAPPY GRANDALE MIX)', NULL, N'PAPAYA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (207, 10, N'IF YOU WERE HERE (B4 ZA BEAT MIX)', NULL, N'JENNIFER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (208, 10, N'never let you down', NULL, N'good-cool feat. JP Miles', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (209, 10, N'.59', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (210, 10, N'era (nostalmix)', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (211, 10, N'Let''s talk it over', NULL, N'SHIN Murayama feat. Argie Phine', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (212, 10, N'Make Your Move', NULL, N'good-cool feat. JP Miles', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (213, 10, N'Holic', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (214, 10, N'LEADING CYBER', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (215, 10, N'Don''t Stop! (AMD 2nd MIX)', NULL, N'Dr.VIBE feat. JP miles', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (216, 10, N'Get me in your sight (AMD CANCUN MIX)', NULL, N'SYMPHONIC DEFOGGERS with 1479', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (217, 13, N'CAFE', NULL, N'D.D.SOUND', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (218, 13, N'CAT''S EYE (Ventura Mix)', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (219, 13, N'CONGA FEELING', NULL, N'VIVIAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (220, 13, N'Lupin the 3rd ''78', NULL, N'VENTURA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (221, 13, N'NA-NA', NULL, N'BUS STOP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (222, 13, N'PETIT LOVE', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (223, 13, N'RHYTHM AND POLICE (K.O.G G3 MIX)', NULL, N'CJ CREW feat. CHRISTIAN D.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (224, 13, N'SKY HIGH', NULL, N'LUCYFER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (225, 13, N'SYNCHRONIZED LOVE (Red Monster Hyper Mix)', NULL, N'JOE RINOIE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (226, 13, N'WONDA (SPEED K MIX)', NULL, N'MM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (227, 13, N'DO ME (H.I.G.E.O. MIX)', NULL, N'MUSTACHE MEN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (228, 13, N'THEME FROM ENTER THE DRAGON (Revival 2001 Mix)', NULL, N'B3-PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (229, 14, N'17才', '17 SAI', N'BAMBEE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (230, 14, N'AGAINST ALL ODDS (Definitive MIX)', NULL, N'DEJAVU featuring TASMIN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (231, 14, N'BE TOGETHER', NULL, N'NI-NI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (232, 14, N'CAN''T STOP FALLIN'' IN LOVE (SPEED MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (233, 14, N'DANCING ALL ALONE', NULL, N'SMiLE.dk', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (234, 14, N'HOT LIMIT', NULL, N'JOHN DESIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (235, 14, N'MOONLIGHT SHADOW (New Vocal Version)', NULL, N'MISSING HEART', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (236, 14, N'MOVIN ON (Extended Moon Mix)', NULL, N'ELLEN GEE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (237, 14, N'MY GENERATION (Fat Beat Mix)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (238, 14, N'NEVER ENDING STORY (Power Club Vocal Mix)', NULL, N'DJ AC-DC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (239, 14, N'NO LIMIT (RM Remix)', NULL, N'2 UNLIMITED', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (240, 14, N'おどるポンポコリン', 'ODORU PONPOKORIN', N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (241, 14, N'OOPS!...I DID IT AGAIN (Fired Up MIX)', NULL, N'ROCHELLE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (242, 14, N'RIGHT NOW', NULL, N'ATOMIC KITTEN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (243, 14, N'ロマンスの神様', 'GOD OF ROMANCE / ROMANSU NO KAMISAMA', N'JUDY CRYSTAL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (244, 14, N'SWING IT', NULL, N'BUS STOP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (245, 14, N'TEST MY BEST', NULL, N'E-ROTIC', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (246, 14, N'THE TWIST (Double Pump MIX)', NULL, N'LIBERTY ALL STAZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (247, 14, N'TRIBAL DANCE (Almighty Mix)', NULL, N'2 UNLIMITED', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (248, 14, N'AFRONOVA PRIMEVAL', NULL, N'8bit', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (249, 14, N'B4U glorious style', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (250, 14, N'BROKEN MY HEART', NULL, N'NAOKI feat. PAULA TERRY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (251, 14, N'DIVE', NULL, N'BeForU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (252, 14, N'DYNAMITE RAVE (Long ver.)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (253, 14, N'ECSTASY', NULL, N'd-complex', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (254, 14, N'Healing Vision', NULL, N'DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (255, 14, N'INSERTiON', NULL, N'NAOKI underground', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (256, 14, N'祭 JAPAN', 'MATSURI JAPAN', N'RE-VENGE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (257, 14, N'PARANOiA ETERNAL', NULL, N'STM200', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (258, 14, N'Remember You', NULL, N'NM feat. Julie', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (259, 14, N'STILL IN MY HEART', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (260, 14, N'ABSOLUTE', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (261, 14, N'Abyss', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (262, 14, N'DXY!', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (263, 14, N'Electro Tuned (the SubS mix)', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (264, 14, N'I Was The One', NULL, N'good-cool', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (265, 14, N'Mr.T. (take me higher)', NULL, N'Risky Men feat. Asuka M', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (266, 14, N'Radical Faith', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (267, 14, N'サナ・モレッテ・ネ・エンテ', 'SANA MOLLETE NE ENTE', N'Togo Project feat. Sana', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (268, 14, N'THE CUBE', NULL, N'DJ SUWAMI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (269, 15, N'LOVIN'' YOU (ROB SEARLE CLUB MIX)', NULL, N'VINYL BABY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (270, 15, N'SOMEWHERE OVER THE RAINBOW', NULL, N'COSMIC GATE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (271, 15, N'HIGHS OFF U (Scorccio XY Mix)', NULL, N'4 REEEL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (272, 15, N'WWW.BLONDE GIRL (MOMO MIX)', NULL, N'JENNY ROM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (273, 15, N'ORDINARY WORLD', NULL, N'AURORA featuring NAMIEE COLEMAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (274, 15, N'BYE BYE BABY BALLOON', NULL, N'JOGA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (275, 15, N'COW GIRL', NULL, N'BAMBEE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (276, 15, N'GHOSTS (VINCENT DE MOOR REMIX)', NULL, N'TENTH PLANET', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (277, 15, N'MIRACLE', NULL, N'ST.JENNARO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (278, 15, N'WITCH DOCTOR (GIANTS TOONS VERSION)', NULL, N'CARTOONS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (279, 15, N'DO YOU REMEMBER ME', NULL, N'JENNY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (280, 15, N'TELEPHONE OPERATOR (Club MIX)', NULL, N'SHELLEY PETER', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (281, 15, N'JUSTIFY MY LOVE', NULL, N'TESS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (282, 15, N'The Centre Of The Heart (STONEBRIDGE CLUBMIX)', NULL, N'Roxette', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (283, 15, N'夜空ノムコウ', 'YOZORA NO MUKOU', N'EUROBEAT LOVERS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (284, 15, N'I''M IN THE MOOD FOR DANCING', NULL, N'SHARON', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (285, 15, N'NORI NORI NORI', NULL, N'JUDY CRYSTAL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (286, 15, N'LET''S GROOVE', NULL, N'TIPS & TRICKS VS WISDOME', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (287, 15, N'TWILIGHT ZONE (R-C Extended Club MIX)', NULL, N'2 UNLIMITED', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (288, 15, N'そばかす FRECKLES (KCP Re-Edit)', 'SOBAKASU FRECKLES (KCP Re-Edit)', N'TIGGY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (289, 15, N'FLASH IN THE NIGHT', NULL, N'FLASHMAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (290, 15, N'MY SWEET DARLIN''', NULL, N'WILDSIDE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (291, 15, N'SO DEEP (PERFECT SPHERE REMIX)', NULL, N'SILVERTEAR', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (292, 15, N'FOLLOW ME', NULL, N'LADY BABY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (293, 15, N'FANTASY', NULL, N'MELISSA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (294, 15, N'true... (radio edit)', NULL, N'小坂りゆ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (295, 15, N'Firefly', NULL, N'BeForU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (296, 15, N'exotic ethnic', NULL, N'RevenG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (297, 15, N'ON THE JAZZ', NULL, N'Jonny Dynamite!', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (298, 15, N'DIVE(more deep & deeper style)', NULL, N'Be For U', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (299, 15, N'Groove', NULL, N'Sho-T feat. Brenda', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (300, 15, N'Do It Right', NULL, N'SOTA feat. Ebony Fay', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (301, 15, N'Share My Love', NULL, N'Julie Frost', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (302, 15, N'Look To The Sky', NULL, N'System S.F. feat.ANNA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (303, 15, N'Let the beat hit em! (CLASSIC R&B STYLE)', NULL, N'STONE BROS.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (304, 15, N'Midnite Blaze', NULL, N'U1 Jewel Style', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (305, 15, N'Healing Vision (Angelic mix)', NULL, N'2MB', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (306, 15, N'Groove 2001', NULL, N'Sho-T feat. Brenda', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (307, 15, N'ORION.78 ～civilization mix～', NULL, N'2MB', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (308, 15, N'true... (trance sunrise mix)', NULL, N'小坂りゆ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (309, 15, N'MAX 300', NULL, N'Ω', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (310, 15, N'CANDY☆', 'CANDY(STAR)', N'Luv UNLIMITED', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (311, 16, N'A MINUTE (Extended Mix)', NULL, N'X-TREME', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (312, 16, N'DRIFTING AWAY', NULL, N'LANGE feat. SKYE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (313, 16, N'FANTASY', NULL, N'LOCKOUT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (314, 16, N'IT''S RAINING MEN (Almighty Mix)', NULL, N'GERI HALLIWELL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (315, 16, N'LONG TRAIN RUNNIN''', NULL, N'BUS STOP', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (316, 16, N'LOOK AT US (Daddy DJ Remix)', NULL, N'SARINA PARIS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (317, 16, N'MAXIMUM OVERDRIVE (KC Club Mix)', NULL, N'2 UNLIMITED', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (318, 16, N'NOTHING GONNA STOP (Dance Mania Mix)', NULL, N'MICKY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (319, 16, N'STAY', NULL, N'TESS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (320, 16, N'THE REFLEX', NULL, N'DURAN DURAN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (321, 16, N'TRANCE DE JANEIRO (SAMBA DE JANEIRO 2002 Epic Vocal Remix)', NULL, N'BELLINI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (322, 16, N'BABY LOVE ME', NULL, N'JUDY CRYSTAL', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (323, 16, N'LITTLE BOY (BOY ON BOY MIX)', NULL, N'CAPTAIN JACK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (324, 16, N'LIVING IN AMERICA', NULL, N'ROSE & JOHN', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (325, 16, N'MORE THAN I NEEDED TO KNOW', NULL, N'SCOOTH', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (326, 16, N'SO FABULOUS SO FIERCE (FREAK OUT)', NULL, N'THUDERPUSS feat. JOCELYN ENRIQUEZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (327, 16, N'THE WHISTLE SONG (Blow My Whistle Bitch)', NULL, N'DJ ALLIGATOR PROJECT', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (328, 16, N'THERE YOU''LL BE', NULL, N'DJ SPEEDO feat. ANGELICA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (329, 16, N'WAKA LAKA', NULL, N'JENNY ROM vs ZIPPERS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (330, 16, N'DESTINY', NULL, N'NAOKI feat. PAULA TERRY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (331, 16, N'ever snow', NULL, N'YOMA KOMATSU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (332, 16, N'rain of sorrow', NULL, N'NM feat. EBONY FAY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (333, 16, N'Secret Rendez-vous', NULL, N'DIVAS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (334, 16, N'CANDY♥', 'CANDY(HEART)', N'小坂りゆ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (335, 16, N'D2R', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (336, 16, N'DIVE TO THE NIGHT', NULL, N'小坂りゆ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (337, 16, N'Sweet Sweet ♥ Magic', 'Sweet Sweet Love Magic', N'jun', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (338, 16, N'TSUGARU', NULL, N'RevenG VS DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (339, 16, N'BRE∀K DOWN!', 'BREAK DOWN!', N'BeForU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (340, 16, N'Burning Heat! (3 Option Mix)', NULL, N'Mr.T with Motoaki.F', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (341, 16, N'i feel ...', NULL, N'AKIRA YAMAOKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (342, 16, N'Spin the disc', NULL, N'good-cool', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (343, 16, N'HIGHER (next morning mix)', NULL, N'NM feat. SUNNY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (344, 16, N'AFRONOVA (FROM NONSTOP MEGAMIX)', NULL, N'RE-VENGE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (345, 16, N'AM-3P (AM EAST mix)', NULL, N'kTz', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (346, 16, N'B4U (B4 ZA BEAT MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (347, 16, N'BRILLIANT 2U (K.O.G G3 MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (348, 16, N'BURNIN'' THE FLOOR (BLUE FIRE mix)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (349, 16, N'CELEBRATE NITE (EURO TRANCE STYLE)', NULL, N'N.M.R', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (350, 16, N'DROP OUT (FROM NONSTOP MEGAMIX)', NULL, N'NW260', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (351, 16, N'DYNAMITE RAVE (B4 ZA BEAT MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (352, 16, N'ECSTASY (midnight blue mix)', NULL, N'd-compleX', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (353, 16, N'HYSTERIA 2001', NULL, N'NM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (354, 16, N'祭 JAPAN (FROM NONSTOP MEGAMIX)', 'MATSURI JAPAN (FROM NONSTOP MEGAMIX)', N'RE-VENGE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (355, 16, N'MY SUMMER LOVE (TOMMY''S SMILE MIX)', NULL, N'mitsu-O! with GEILA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (356, 16, N'Silent Hill (3rd christmas mix)', NULL, N'THOMAS HOWARD', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (357, 16, N'SEXY PLANET (FROM NONSTOP MEGAMIX)', NULL, N'Crystal Aliens', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (358, 16, N'STILL IN MY HEART (MOMO MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (359, 16, N'SUPER STAR (FROM NONSTOP MEGAMIX)', NULL, N'D.J.RICH feat. Tailbros.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (360, 16, N'TSUGARU (APPLE MIX)', NULL, N'RevenG VS DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (361, 16, N'WILD RUSH (FROM NONSTOP MEGAMIX)', NULL, N'FACTOR-X', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (362, 16, N'MAXX UNLIMITED', NULL, N'Z', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (363, 16, N'革命', 'REVOLUTION / KAKUMEI', N'dj TAKA with NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (364, 17, N'LA COPA DE LA VIDA', NULL, N'PATRICK VICTORIO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (365, 17, N'WE ARE THE CHAMPIONS (Factory Team Remix)', NULL, N'LIVE 2 LOVE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (366, 17, N'WE WILL ROCK YOU', NULL, N'HOUSEBOYZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (367, 17, N'I DO I DO I DO', NULL, N'CREAMY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (368, 17, N'SENORITA (Speedy Mix)', NULL, N'JENNY ROM', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (369, 17, N'SPEED OVER BEETHOVEN', NULL, N'ROSE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (370, 17, N'IRRESISTIBLEMENT', NULL, N'WILDSIDE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (371, 17, N'CARTOON HEROES (Speedy Mix)', NULL, N'BARBIE YOUNG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (372, 17, N'GRADUATION ～それぞれの明日～', 'GRADUATION ~sorezore no ashita~', N'BeForU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (373, 17, N'1998', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (374, 17, N'LOVE♥SHINE', 'LOVE SHINE', N'小坂りゆ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (375, 17, N'HYPER EUROBEAT', NULL, N'NAOKI feat. DDR ALL STARS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (376, 17, N'MEMORIES', NULL, N'NAOKI feat. PAULA TERRY', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (377, 17, N'VANITY ANGEL', NULL, N'FIXX', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (378, 17, N'CRASH!', NULL, N'mr.BRIAN & THE FINAL BAND', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (379, 17, N'TEARS', NULL, N'NAOKI underground feat.EK', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (380, 17, N'bag', NULL, N'RevenG', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (381, 17, N'AM-3P (303 BASS MIX)', NULL, N'KTz (remixed by U1)', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (382, 17, N'CUTIE CHASER (MORNING MIX)', NULL, N'CLUB SPICE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (383, 17, N'Do It Right (Harmonized 2Step Mix)', NULL, N'SOTA feat.Ebony Fay', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (384, 17, N'DROP THE BOMB (System S.F. Mix)', NULL, N'Scotty D.', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (385, 17, N'Kind Lady', NULL, N'OKUYATOS', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (386, 17, N'SO IN LOVE', NULL, N'Caramel.S', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (387, 17, N'321STARS', NULL, N'DJ SIMON', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (388, 17, N'air', NULL, N'DJ SIMON', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (389, 17, N'BE LOVIN', NULL, N'D-Crew', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (390, 17, N'Miracle Moon ～L.E.D.LIGHT STYLE MIX～‎', NULL, N'Togo Project feat. Sana', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (391, 17, N'A', NULL, N'D.J.Amuro', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (392, 17, N'Colors (for EXTREME)', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (393, 17, N'Happy Wedding', NULL, N'ASKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (394, 17, N'L''amour et la liberté (DDR ver.)', NULL, N'NAOKI underground', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (395, 17, N'stoic (EXTREME version)', NULL, N'TaQ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (396, 17, N'V (for EXTREME)', NULL, N'TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (397, 17, N'蒼い衝動 (for EXTREME)', 'BLUE IMPULSE / AOI SHOUDOU (for EXTREME)', N'NAOKI feat.YUKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (398, 17, N'feeling of love', NULL, N'youhei shimizu', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (399, 17, N'JANEJANA', NULL, N'T.E.M.P.O. feat.Mohammed & Emi', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (400, 17, N'KISS KISS KISS', NULL, N'NAOKI feat. SHANTI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (401, 17, N'KISS ME ALL NIGHT LONG', NULL, N'NAOKI J-STYLE feat.MIU', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (402, 17, N'MOBO★MOGA', 'MOBO MOGA', N'Orange Lounge', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (403, 17, N'STAY (Organic house Version)', NULL, N'emi', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (404, 17, N'Destiny lovers', NULL, N'くにたけみゆき', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (405, 17, N'I''m gonna get you!', NULL, N'Kelly Cosmo', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (406, 17, N'JET WORLD', NULL, N'Mutsuhiko Izumi', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (407, 17, N'三毛猫ロック', 'CALICO CAT ROCK / MIKENEKO ROCK', N'亜熱帯マジ-SKA爆弾', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (408, 17, N'Frozen Ray (for EXTREME)', NULL, N'dj TAKA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (409, 17, N'Pink Rose', NULL, N'Kiyommy+Seiya', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (410, 17, N'Gamelan de Couple', NULL, N'TOMOSUKE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (411, 17, N'LA BAMBA', NULL, N'メキシコ民謡', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (412, 17, N'HOLD ON ME', NULL, N'tiger YAMATO', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (413, 17, N'大見解', 'DAIKENKAI', N'Des-ROW feat. TSUBOI for ALPHA', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (414, 17, N'♥LOVE²シュガ→♥', 'LOVE2 SUGAR', N'dj TAKA feat. のりあ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (415, 17, N'White Lovers', NULL, N'新谷さなえ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (416, 17, N'魔法の扉 (スペース@マコのテーマ)', 'MAGIC DOOR / MAHOU NO TOBIRA (Theme of SPACE MAKO)', N'a.s.a', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (417, 17, N'BURNIN'' THE FLOOR (MOMO MIX)', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (418, 17, N'TwinBee ～Generation X～', NULL, N'FinalOffset', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (419, 17, N'sync (EXTREME version)', NULL, N'OutPhase', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (420, 17, N'The Least 100sec', NULL, N'Hirofumi Sasaki', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (421, 17, N'Across the nightmare', NULL, N'Jimmy Weckl', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (422, 17, N'Heaven is a ''57 metallic gray (gimmix)', NULL, N'Hiro feat. Sweet little 30''s', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (423, 17, N'Last Message', NULL, N'good-cool feat. Meg', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (424, 17, N'xenon', NULL, N'Mr.T', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (425, 17, N'桜', 'SAKURA', N'Reven-G', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (426, 17, N'DYNAMITE RAVE -Down Bird SOTA mix-', NULL, N'NAOKI', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (427, 17, N'Look To The Sky -True Color Mix-', NULL, N'SySF. feat. Anna', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (428, 17, N'TRIP MACHINE survivor', NULL, N'DE-SIRE', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (429, 17, N'PARANOIA survivor', NULL, N'270', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (430, 17, N'PARANOIA survivor MAX', NULL, N'290', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (431, 17, N'The legend of MAX', NULL, N'ZZ', NULL)
GO
INSERT [dbo].[Songs] ([SongId], [FirstAppeared], [Title], [TitleRomanized], [Artist], [ArtistRomanized]) VALUES (432, 17, N'Dance Dance Revolution', NULL, N'DDR ALL STARS', NULL)
GO
SET IDENTITY_INSERT [dbo].[Songs] OFF
GO
ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [DefaultNonAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[Hints]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_CorrectAnswer] FOREIGN KEY([CorrectAnswer])
REFERENCES [dbo].[Songs] ([SongId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_CorrectAnswer]
GO
ALTER TABLE [dbo].[SessionQuestion]  WITH CHECK ADD  CONSTRAINT [FK_SessionQuestion_GivenAnswer] FOREIGN KEY([GivenAnswer])
REFERENCES [dbo].[Songs] ([SongId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SessionQuestion] CHECK CONSTRAINT [FK_SessionQuestion_GivenAnswer]
GO
ALTER TABLE [dbo].[SessionQuestion]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[SessionQuestion]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([SessionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Players] ([PlayerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_FirstAppeared] FOREIGN KEY([FirstAppeared])
REFERENCES [dbo].[Mixes] ([MixId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_FirstAppeared]
GO
