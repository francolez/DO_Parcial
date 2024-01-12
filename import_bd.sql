

USE Kaggle
GO

--Crear tabla
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks')	AND type='U')
CREATE TABLE dbo.starbucks (
                 baverage_categ VARCHAR(50),
				 beverage VARCHAR(100),
				 beverage_prep VARCHAR (50),
				 calories DECIMAL(6,3),
				 total_fat_g VARCHAR(10),
				 trans_fat_g DECIMAL(6,3),
				 satured_fat_g DECIMAL (6,3),
				 sodium_mg DECIMAL (6,3),
				 total_carbohydrates_g DECIMAL (6,3),
				 cholesterol_mg DECIMAL (6,3),
				 dietery_fibre_g DECIMAL(6,3),
				 sugars_g DECIMAL(6,3),
				 protein_g DECIMAL (6,3),
				 vitamin_a_pct VARCHAR(10),
				 vitamin_c_pct VARCHAR(10),
				 calcium_pct VARCHAR(10),
				 iron_pct VARCHAR(10),
				 caffeine_mg VARCHAR(10)

)
TRUNCATE TABLE dbo.starbucks
GO

--importar data desde archivo

BULK INSERT dbo.starbucks
FROM 'C:\Users\Franco\Documents\proyecto_parcial\dataset\starbucks.csv'
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
)
GO

