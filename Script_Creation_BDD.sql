/****** Object:  Table [dbo].[adapter]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adapter](
	[codSpe1] [int] NOT NULL,
	[codSpe2] [int] NOT NULL,
	[codFiliere] [int] NOT NULL,
	[txReussite] [smallint] NOT NULL,
 CONSTRAINT [PK_adapter] PRIMARY KEY CLUSTERED 
(
	[codSpe1] ASC,
	[codSpe2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[approprier]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[approprier](
	[codFiliere] [int] NOT NULL,
	[codMetier] [int] NOT NULL,
 CONSTRAINT [PK_approprier] PRIMARY KEY CLUSTERED 
(
	[codFiliere] ASC,
	[codMetier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[decomposer]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[decomposer](
	[codFiliereConcours] [int] NOT NULL,
	[codEtape] [int] NOT NULL,
	[noEtape] [smallint] NOT NULL,
 CONSTRAINT [PK_decomposer] PRIMARY KEY CLUSTERED 
(
	[codFiliereConcours] ASC,
	[codEtape] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[domaines]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[domaines](
	[codDomaine] [int] NOT NULL,
	[nomDomaine] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_domaines] PRIMARY KEY CLUSTERED 
(
	[codDomaine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etablissements]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etablissements](
	[codEtab] [int] NOT NULL,
	[nomEtab] [nvarchar](50) NOT NULL,
	[adrEtab] [nchar](100) NOT NULL,
	[dptEtab] [smallint] NOT NULL,
 CONSTRAINT [PK_etablissements] PRIMARY KEY CLUSTERED 
(
	[codEtab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etapes]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etapes](
	[codEtape] [int] NOT NULL,
	[nomEtape] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_etapes] PRIMARY KEY CLUSTERED 
(
	[codEtape] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filieres]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filieres](
	[codFiliere] [int] NOT NULL,
	[nomFiliere] [nvarchar](50) NOT NULL,
	[dureeEtudes] [smallint] NOT NULL,
	[resumeFiliere] [nvarchar](200) NOT NULL,
	[modalitesRecrutement] [nvarchar](50) NOT NULL,
	[codDomaine] [int] NOT NULL,
 CONSTRAINT [PK_filieres] PRIMARY KEY CLUSTERED 
(
	[codFiliere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filieres_concours]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filieres_concours](
	[codFiliereConcours] [int] NOT NULL,
	[codFiliere] [int] NOT NULL,
 CONSTRAINT [PK_filieres_concours] PRIMARY KEY CLUSTERED 
(
	[codFiliereConcours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metiers]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metiers](
	[codMetier] [int] NOT NULL,
	[nomMetier] [nvarchar](50) NOT NULL,
	[resumeMetier] [nvarchar](200) NOT NULL,
	[salaireDebutantMetier] [int] NOT NULL,
 CONSTRAINT [PK_metiers] PRIMARY KEY CLUSTERED 
(
	[codMetier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offrir]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offrir](
	[codFiliere] [int] NOT NULL,
	[codEtab] [int] NOT NULL,
 CONSTRAINT [PK_offrir] PRIMARY KEY CLUSTERED 
(
	[codFiliere] ASC,
	[codEtab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organisation]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[organisation](
	[codFiliereConcours] [int] NOT NULL,
	[codEtab] [int] NOT NULL,
	[codEtape] [int] NOT NULL,
	[dtDebutEtape] [date] NOT NULL,
	[dtFinEtape] [date] NOT NULL,
 CONSTRAINT [PK_organisation] PRIMARY KEY CLUSTERED 
(
	[codFiliereConcours] ASC,
	[codEtab] ASC,
	[codEtape] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reorienter]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reorienter](
	[codFiliereActuelle] [int] NOT NULL,
	[codFiliereNouvelle] [int] NOT NULL,
 CONSTRAINT [PK_reorienter] PRIMARY KEY CLUSTERED 
(
	[codFiliereActuelle] ASC,
	[codFiliereNouvelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialites]    Script Date: 29/10/2021 11:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialites](
	[codSpecialite] [int] NOT NULL,
	[nomSpecialite] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_specialites] PRIMARY KEY CLUSTERED 
(
	[codSpecialite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adapter]  WITH CHECK ADD  CONSTRAINT [FK_adapter_filieres] FOREIGN KEY([codFiliere])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[adapter] CHECK CONSTRAINT [FK_adapter_filieres]
GO
ALTER TABLE [dbo].[adapter]  WITH CHECK ADD  CONSTRAINT [FK_adapter_spe1] FOREIGN KEY([codSpe1])
REFERENCES [dbo].[specialites] ([codSpecialite])
GO
ALTER TABLE [dbo].[adapter] CHECK CONSTRAINT [FK_adapter_spe1]
GO
ALTER TABLE [dbo].[adapter]  WITH CHECK ADD  CONSTRAINT [FK_adapter_spe2] FOREIGN KEY([codSpe2])
REFERENCES [dbo].[specialites] ([codSpecialite])
GO
ALTER TABLE [dbo].[adapter] CHECK CONSTRAINT [FK_adapter_spe2]
GO
ALTER TABLE [dbo].[approprier]  WITH CHECK ADD  CONSTRAINT [FK_approprier_filieres] FOREIGN KEY([codFiliere])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[approprier] CHECK CONSTRAINT [FK_approprier_filieres]
GO
ALTER TABLE [dbo].[approprier]  WITH CHECK ADD  CONSTRAINT [FK_approprier_metiers] FOREIGN KEY([codMetier])
REFERENCES [dbo].[metiers] ([codMetier])
GO
ALTER TABLE [dbo].[approprier] CHECK CONSTRAINT [FK_approprier_metiers]
GO
ALTER TABLE [dbo].[decomposer]  WITH CHECK ADD  CONSTRAINT [FK_decomposer_etapes] FOREIGN KEY([codEtape])
REFERENCES [dbo].[etapes] ([codEtape])
GO
ALTER TABLE [dbo].[decomposer] CHECK CONSTRAINT [FK_decomposer_etapes]
GO
ALTER TABLE [dbo].[decomposer]  WITH CHECK ADD  CONSTRAINT [FK_decomposer_filieres_concours] FOREIGN KEY([codFiliereConcours])
REFERENCES [dbo].[filieres_concours] ([codFiliereConcours])
GO
ALTER TABLE [dbo].[decomposer] CHECK CONSTRAINT [FK_decomposer_filieres_concours]
GO
ALTER TABLE [dbo].[filieres]  WITH CHECK ADD  CONSTRAINT [FK_filieres_domaines] FOREIGN KEY([codDomaine])
REFERENCES [dbo].[domaines] ([codDomaine])
GO
ALTER TABLE [dbo].[filieres] CHECK CONSTRAINT [FK_filieres_domaines]
GO
ALTER TABLE [dbo].[filieres_concours]  WITH CHECK ADD  CONSTRAINT [FK_filieres_concours_filieres_concours] FOREIGN KEY([codFiliere])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[filieres_concours] CHECK CONSTRAINT [FK_filieres_concours_filieres_concours]
GO
ALTER TABLE [dbo].[offrir]  WITH CHECK ADD  CONSTRAINT [FK_offrir_etablissements1] FOREIGN KEY([codEtab])
REFERENCES [dbo].[etablissements] ([codEtab])
GO
ALTER TABLE [dbo].[offrir] CHECK CONSTRAINT [FK_offrir_etablissements1]
GO
ALTER TABLE [dbo].[offrir]  WITH CHECK ADD  CONSTRAINT [FK_offrir_filieres] FOREIGN KEY([codFiliere])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[offrir] CHECK CONSTRAINT [FK_offrir_filieres]
GO
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD  CONSTRAINT [FK_organisation_etablissements] FOREIGN KEY([codEtab])
REFERENCES [dbo].[etablissements] ([codEtab])
GO
ALTER TABLE [dbo].[organisation] CHECK CONSTRAINT [FK_organisation_etablissements]
GO
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD  CONSTRAINT [FK_organisation_etapes] FOREIGN KEY([codEtape])
REFERENCES [dbo].[etapes] ([codEtape])
GO
ALTER TABLE [dbo].[organisation] CHECK CONSTRAINT [FK_organisation_etapes]
GO
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD  CONSTRAINT [FK_organisation_filieres_concours] FOREIGN KEY([codFiliereConcours])
REFERENCES [dbo].[filieres_concours] ([codFiliereConcours])
GO
ALTER TABLE [dbo].[organisation] CHECK CONSTRAINT [FK_organisation_filieres_concours]
GO
ALTER TABLE [dbo].[reorienter]  WITH CHECK ADD  CONSTRAINT [FK_reorienter_filiereActuelle] FOREIGN KEY([codFiliereActuelle])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[reorienter] CHECK CONSTRAINT [FK_reorienter_filiereActuelle]
GO
ALTER TABLE [dbo].[reorienter]  WITH CHECK ADD  CONSTRAINT [FK_reorienter_filiereNouvelle] FOREIGN KEY([codFiliereNouvelle])
REFERENCES [dbo].[filieres] ([codFiliere])
GO
ALTER TABLE [dbo].[reorienter] CHECK CONSTRAINT [FK_reorienter_filiereNouvelle]
GO

*.sql linguist-language=sql
